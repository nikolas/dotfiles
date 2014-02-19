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
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#eaeaea" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#000000"))
 '(column-number-mode t)
 '(custom-enabled-themes (quote (sanityinc-tomorrow-blue)))
 '(custom-safe-themes (quote ("82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" default)))
 '(fci-rule-color "#2a2a2a")
 '(standard-indent 2)
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#d54e53") (40 . "#e78c45") (60 . "#e7c547") (80 . "#b9ca4a") (100 . "#70c0b1") (120 . "#7aa6da") (140 . "#c397d8") (160 . "#d54e53") (180 . "#e78c45") (200 . "#e7c547") (220 . "#b9ca4a") (240 . "#70c0b1") (260 . "#7aa6da") (280 . "#c397d8") (300 . "#d54e53") (320 . "#e78c45") (340 . "#e7c547") (360 . "#b9ca4a"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'load-path "~/.emacs.d/elisp/")
(load-library "style")
(load-library "keys")
(load-library "modes")

(if (not (getenv "TERM_PROGRAM"))
    (load "path"))

(setq vc-handled-backends ())

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

;; automatically clean up bad whitespace
(setq whitespace-action '(auto-cleanup))

;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(when (require 'rvm nil 'noerror)
  (rvm-use-default)
  )

(require 'rcirc)
(rcirc-track-minor-mode 1)
(setq rcirc-omit-responses '("JOIN" "PART" "QUIT" "NICK" "AWAY"))
(setq rcirc-server-alist
      '(("chat.freenode.net" :channels ("#tesc" "#sxemacs"))
        ("irc.esper.net" :channels ("#datafruitsouth"))))
(setq rcirc-default-nick "dobie_gillis")


;~~~~~~~~~~----______________
(shell)
(server-start)
