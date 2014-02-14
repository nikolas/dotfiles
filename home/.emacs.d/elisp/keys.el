;; key bindings

(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-cl" 'goto-line)
(global-set-key "\C-ce" 'edebug-defun)
(when (require 'ember-rails nil 'noerror)
  (global-set-key "\C-c,e" 'ember-rails-toggle-file)
  )
