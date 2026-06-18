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
