; Set background color for highlight face to red
(set-face-attribute 'highlight nil :background "#ff0000")

(when window-system
  (set-frame-parameter nil 'alpha-background 90)
  (set-face-attribute 'default (selected-frame) :height 110)
  )

(load-theme 'wombat t)
