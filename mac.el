(server-start) ;; we want to use emacsclient

(defadvice handle-delete-frame (around my-handle-delete-frame-advice activate)
  "Hide Emacs instead of closing the last frame"
  (let ((frame   (posn-window (event-start event)))
        (numfrs  (length (frame-list))))
    (if (> numfrs 1)
        ad-do-it
      (do-applescript "tell application \"System Events\" to tell process \"Emacs\" to set visible to false"))))

;; better cider repl bindings
(after! clojure-mode
  (map! "<s-up>" #'cider-repl-backward-input
        "<s-down>" #'cider-repl-forward-input
        "<s-right>" #'right-word
        "<s-left>" #'left-word))

(when-let (dims (doom-store-get 'last-frame-size doom-store-location))
  (cl-destructuring-bind ((left . top) width height fullscreen) dims
    (setq initial-frame-alist
          (append initial-frame-alist
                  `((left . ,left)
                    (top . ,top)
                    (width . ,width)
                    (height . ,height)
                    (fullscreen . ,fullscreen))))))

(defun save-frame-dimensions ()
  (doom-store-put 'last-frame-size
                  (list (frame-position)
                        (frame-width)
                        (frame-height)
                        (frame-parameter nil 'fullscreen))))

(add-hook 'kill-emacs-hook #'save-frame-dimensions)

(map! "s-v" #'clipboard-yank)
(map! "<home>" #'beginning-of-line)
(map! "<end>" #'end-of-line)
(map! "s-n" #'evil-complete-next)

(setq select-enable-primary t)
(setq select-enable-clipboard nil)
