(set-frame-parameter (selected-frame) 'alpha '(90 50))
(add-to-list 'default-frame-alist '(alpha 90 50))

(set-face-attribute 'default nil :height 120)
(setq menu-bar-mode nil)

(when (require 'color-theme-sanityinc-tomorrow nil 'noerror)
  (color-theme-sanityinc-tomorrow-blue)
  )
