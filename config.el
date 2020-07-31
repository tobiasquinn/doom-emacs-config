;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tobias Quinn	"
      user-mail-address "tobias@tobiasquinn.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'deeper-blue)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Orgzly")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;;(setq display-line-numbers-type nil)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; scroll using meta key
(global-set-key (kbd "M-<up>") 'scroll-down-line)
(global-set-key (kbd "M-<down>") 'scroll-up-line)
;; home, end using meta key
(global-set-key (kbd "M-<left>") 'beginning-of-line)
(global-set-key (kbd "M-<right>") 'end-of-line)

;; window switch using cursor keys
(eval-after-load "evil"
  '(progn
     (define-key evil-normal-state-map (kbd "C-w <left>") 'evil-window-left)
     (define-key evil-normal-state-map (kbd "C-w <right>") 'evil-window-right)
     (define-key evil-normal-state-map (kbd "C-w <up>") 'evil-window-up)
     (define-key evil-normal-state-map (kbd "C-w <down>") 'evil-window-down)
     (define-key evil-normal-state-map (kbd "C-w o") 'delete-other-windows)
     (evil-set-initial-state 'magit-mode 'emacs)))

;; clojure indent style
(setq clojure-indent-style :always-indent)

;; bind svelte mode
;;(add-to-list 'auto-mode-alist '("\\.svelte$" . svelte-mode))

(defun er-indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

;; format all like vscode
(global-set-key (kbd "C-S-i") #'er-indent-buffer)

(setq js-indent-level 2)

;;(remove-hook! (prog-mode text-mode conf-mode special-mode) hl-line-mode)
;;(setq confirm-kill-emacs nil)

;; elixir_ls
(setq exec-path (append exec-path '("/home/tobias/sourcecode/elixir-ls/release")))

;; stop the hollow cursor on selection
(setq evil-visual-state-cursor 'box)

(after! hl-line (set-face-background 'hl-line "#333333"))
(after! clojure-mode (show-paren-mode 1))
