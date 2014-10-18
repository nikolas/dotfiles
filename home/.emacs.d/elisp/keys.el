;; key bindings

(global-set-key "\C-x\C-d" 'dired)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-ce" 'edebug-defun)
(global-set-key "\C-cr" 'revert-buffer)

(defun my-delete-indentation ()
  (interactive)
  (delete-indentation t))
(global-set-key "\M-j" 'my-delete-indentation)

;; (defun my-maximize-window ()
;;   (interactive)
;;   (enlarge-window))
;; (global-set-key "\M-j" 'my-maximize-window)

;; (defun my-minimize-window ()
;;   (interactive)
;;   (shrink-window-if-larger-than-buffer))
;; (global-set-key "\M-j" 'my-minimize-window)

;; (when (require 'ember-rails nil 'noerror)
;;   (global-set-key "\C-c,e" 'ember-rails-toggle-file)
;;   )
