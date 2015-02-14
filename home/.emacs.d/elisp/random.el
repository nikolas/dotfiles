(defun kill-other-buffers ()
      "Kill all other buffers."
      (interactive)
      (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))

(define-abbrev global-abbrev-table "pdb"
  "from ipdb import set_trace; set_trace()")
