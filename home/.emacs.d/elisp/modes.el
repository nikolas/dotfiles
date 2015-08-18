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

;; whitespace-cleanup
(when (require 'whitespace-cleanup-mode nil 'noerror)
  (global-whitespace-cleanup-mode t))

(autoload 'scss-mode "scss-mode")
(setq css-indent-offset 4)
(setq sass-indent-offset 4)

(setq js-indent-level 4)
(setq django-indent-width 4)
(setq nxml-child-indent 4)

(when (require 'icicles nil 'noerror)
  (icy-mode 1))

(setq-default abbrev-mode t)

; :3
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
         (column (c-langelem-2nd-pos c-syntactic-element))
         (offset (- (1+ column) anchor))
         (steps (floor offset c-basic-offset)))
    (* (max steps 1)
       c-basic-offset)))

(add-hook 'c-mode-common-hook
          (lambda ()
            ;; Add kernel style
            (c-add-style
             "linux-tabs-only"
             '("linux" (c-offsets-alist
                        (arglist-cont-nonempty
                         c-lineup-gcc-asm-reg
                         c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
          (lambda ()
            (let ((filename (buffer-file-name)))
              ;; Enable kernel mode for the appropriate files
              (when (and filename
                         (string-match (expand-file-name "~/src/kernels")
                                       filename))
                (setq indent-tabs-mode t)
                (setq show-trailing-whitespace t)
                                (c-set-style "linux-tabs-only")))))
