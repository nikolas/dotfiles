(setq gnus-use-full-window nil)

;; dirtree
(when (require 'dirtree nil 'noerror)
  )

;; git-gutter
(when (require 'git-gutter nil 'noerror)
  ;; If you enable global minor mode
  (global-git-gutter-mode t)
  ;; Jump to next/previous hunk
  (global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
  (global-set-key (kbd "C-x n") 'git-gutter:next-hunk)
  )

;; window-number
(when (require 'window-number nil 'noerror)
  (window-number-mode 1)
  (window-number-meta-mode)
  )

;; whitespace-cleanup
(when (require 'whitespace-cleanup-mode nil 'noerror)
  (global-whitespace-cleanup-mode t))

; MediaWiki style https://www.mediawiki.org/wiki/User:ArielGlenn/Emacs_as_a_PHP_IDE
(defun my-php-mode-hook ()
  (setq indent-tabs-mode nil)
  (let ((my-tab-width 4))
    (setq tab-width my-tab-width)
    (setq c-basic-indent my-tab-width)
    (set (make-local-variable 'tab-stop-list)
         (number-sequence my-tab-width 200 my-tab-width))))

(with-eval-after-load 'php-mode
  (add-hook 'php-mode-hook 'my-php-mode-hook))

(autoload 'scss-mode "scss-mode")
(setq css-indent-offset 4)
(setq sass-indent-offset 4)

(setq js-indent-level 4)
(setq sgml-basic-offset 4)
(setq js-switch-indent-offset 4)
(setq django-indent-width 4)
(setq nxml-child-indent 4)

;; C

(setq-default tab-width 4
              indent-tabs-mode nil)

(setq c-default-style "stroustrup")

(add-hook 'c-mode-common-hook
          (lambda ()
            (setq c-basic-offset 4
                  indent-tabs-mode nil)))

;; indented switch/case
(c-set-offset 'case-label '+)

(setq mustache-basic-offset 4)

(when (require 'icicles nil 'noerror)
  (icy-mode 1))

;; haskell-mode
(when (require 'haskell-mode nil 'noerror)
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode))

(setq-default abbrev-mode t)

(setq web-mode-style-padding 0)
(setq web-mode-script-padding 0)

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

(with-eval-after-load 'rjsx-mode
  (define-key rjsx-mode-map "<" nil)
  (define-key rjsx-mode-map (kbd "C-d") nil)
  (define-key rjsx-mode-map ">" nil))

(add-to-list 'auto-mode-alist '("\\.es6$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.cjs$" . js-mode))
(add-to-list 'auto-mode-alist '("\\.mjs$" . js-mode))
