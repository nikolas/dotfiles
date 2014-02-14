(menu-bar-mode -1)
(display-time-mode 1)
(global-whitespace-cleanup-mode t)
(show-paren-mode 1)
(if (boundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (boundp 'fringe-mode) (fringe-mode 0))

(when (require 'git-gutter nil 'noerror)
  ;; If you enable global minor mode
  (global-git-gutter-mode t)
  ;; Jump to next/previous hunk
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
  )

(when (require 'window-number nil 'noerror)
  (window-number-mode 1)
  (window-number-meta-mode)
  )

(projectile-global-mode)

(autoload 'scss-mode "scss-mode")

(when (require 'icicles nil 'noerror)
  (icy-mode 1))
