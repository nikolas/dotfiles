(menu-bar-mode -1)
(display-time-mode 1)
(show-paren-mode 1)
(if (boundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (boundp 'fringe-mode) (fringe-mode 0))

(setq gnus-use-full-window nil)

;; dirtree
(when (require 'dirtree nil 'noerror)
  )

;; git-gutter
(when (require 'git-gutter nil 'noerror)
  (custom-set-variables
   '(git-gutter:handled-backends '(git bzr)))
  ;; If you enable global minor mode
  (global-git-gutter-mode t)
  ;; Jump to next/previous hunk
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
  )

;; org
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(if (file-exists-p "~/org")
  (setq org-agenda-files (directory-files "~/org" t "\.org$")))

;; projectile
(when (require 'projectile nil 'noerror)
  (projectile-global-mode))

;; window-number
(when (require 'window-number nil 'noerror)
  (window-number-mode 1)
  (window-number-meta-mode)
  )

(autoload 'scss-mode "scss-mode")
(setq css-indent-offset 4)

(setq js-indent-level 4)

(when (require 'icicles nil 'noerror)
  (icy-mode 1))
