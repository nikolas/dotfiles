(setq menu-bar-mode nil)

; Set background color for highlight face to red
(set-face-attribute 'highlight nil :background "#ff0000")

(when window-system
  ;(set-frame-parameter (selected-frame) 'alpha '(100 50))
  ;(add-to-list 'default-frame-alist '(alpha 100 50))
  ; TODO: only define this when neep is installed
  (set-face-font 'default "-jmk-neep-bold-*-*-*-13-120-*-*-*-*-*-*")
  (set-face-attribute 'default nil :height 120))

;; (custom-set-variables
;;  '(custom-enabled-themes (quote (tsdh-dark)))
;;  )

(load-theme 'tango-dark t)
