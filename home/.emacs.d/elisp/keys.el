;; key bindings

(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-ce" 'edebug-defun)

(defun my-delete-indentation ()
  (interactive)
  (delete-indentation t))
(global-set-key "\M-j" 'my-delete-indentation)

(when (require 'ember-rails nil 'noerror)
  (global-set-key "\C-c,e" 'ember-rails-toggle-file)
  )
