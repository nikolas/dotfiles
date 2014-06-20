;; key bindings

(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-ce" 'edebug-defun)
(when (require 'ember-rails nil 'noerror)
  (global-set-key "\C-c,e" 'ember-rails-toggle-file)
  )
