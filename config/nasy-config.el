;;; config.el --- User config file.                    -*- lexical-binding: t; -*-

;; Author: Nasy <nasyxx@gmail.com>

;;; Commentary:

;; User config file.

;;; Code:

(setq-default user-mail-address "nasyxx@gmail.com"
              use-pyenv t  ;; `t' if you'd like to use pyenv when using pyls
              )

(defun nasy:set-face ()
  "Set custom face."
  (set-face-attribute 'custom-comment              nil :background "#3d4551" :foreground "#cbe3e7" :slant 'italic)
  (set-face-attribute 'font-lock-keyword-face      nil :foreground "#aa96da"                       :slant 'italic)
  (set-face-attribute 'mode-line                   nil :background "#a1de93" :foreground "#2f3e75" :box nil )
  (set-face-attribute 'mode-line-inactive          nil :background "#333"    :foreground "#96A7A9" :box nil)
  (set-face-attribute 'powerline-active0           nil :background "#ffffc1"                       :inherit 'mode-line )
  (set-face-attribute 'powerline-active1           nil :background "#aa96da" :foreground "#2f3e75" :inherit 'mode-line )
  (set-face-attribute 'powerline-active2           nil :background "#d0efb5" :foreground "black"   :inherit 'mode-line)
  (set-face-attribute 'show-paren-match            nil :background "#bfcfff" :foreground "#dc322f" :weight  'ultra-bold)
  (set-face-attribute 'show-paren-match-expression nil :background "#2f3e75"                       :inherit 'unspecified)
  (set-face-attribute 'which-func                  nil                       :foreground "#333"))

(add-hook 'nasy:config-before-hook #'nasy:set-face)


;; sunrise-sunset

(setq calendar-latitude  24.8801
      calendar-longitude 102.8329)


;; Key Bindings for macOS
;;----------------------------------------------------------------------------

;; Cursor Movement

(when *is-a-mac*  ;; init.el:16 (defconst *is-a-mac* (eq system-type 'darwin))
  (global-set-key (kbd "s-<up>")   'beginning-of-buffer)
  (global-set-key (kbd "s-<down>") 'end-of-buffer))


;; Text Operations

(global-set-key (kbd "s-<backspace>") (lambda ()
                                       (interactive)
                                       (kill-line 0)))

(provide 'nasy-config)
;;; nasy-config.el ends here