(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(sml/hidden-modes (quote (" hl-p")))
 '(standard-indent 2)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; key bindings
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-right-command-modifier 'meta)
  )

(add-to-list 'load-path "~/.emacs.d/elisp/")
;(add-to-list 'load-path "~/.emacs.d/elpa/")

(if (not (getenv "TERM_PROGRAM"))
    (load "path"))

(scroll-bar-mode -1)

(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-cl" 'goto-line)

;(require 'git-gutter)
;; If you enable global minor mode
;(global-git-gutter-mode t)
;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

(autoload 'scss-mode "scss-mode")
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

;; No tabs...
(setq-default indent-tabs-mode nil)
(setq default-tab-width 2)
;(standard-display-ascii ?\t "^I")
;; if indent-tabs-mode is off, untabify before saving
(add-hook 'write-file-hooks 
         (lambda () (if (not indent-tabs-mode)
                        (untabify (point-min) (point-max)))
                     nil ))

(menu-bar-mode -1)
;(global-linum-mode t)


(display-time-mode 1)

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))
;; only show bad whitespace
;(setq whitespace-style '(trailing space-before-tab indentation empty space-after-tab))
(global-whitespace-cleanup-mode t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'window-number)
(window-number-mode 1)
(window-number-meta-mode)

(sml/setup)

(require 'color-theme)
(color-theme-initialize)
(color-theme-clarity)

(projectile-global-mode)
