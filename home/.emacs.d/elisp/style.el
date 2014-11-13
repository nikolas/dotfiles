(setq menu-bar-mode nil)

(when window-system
  ;(set-frame-parameter (selected-frame) 'alpha '(100 50))
  ;(add-to-list 'default-frame-alist '(alpha 100 50))
  ; TODO: only define this when neep is installed
  (set-face-font 'default "-jmk-neep-bold-*-*-*-13-120-*-*-*-*-*-*")
  (set-face-attribute 'default nil :height 120))
