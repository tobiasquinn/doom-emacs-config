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
