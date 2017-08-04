;; key bindings

(global-set-key (kbd "C-x C-d") 'dired)
(global-set-key (kbd "C-x d") 'dired)
(global-set-key (kbd "C-c p") 'pwd)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c e") 'edebug-defun)
(global-set-key (kbd "C-c r") 'revert-buffer)

(defun my-delete-indentation ()
  (interactive)
  (delete-indentation t))
(global-set-key (kbd "M-j") 'my-delete-indentation)

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

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x M-g") 'magit-dispatch-popup)
