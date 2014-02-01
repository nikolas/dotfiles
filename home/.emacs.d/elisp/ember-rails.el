;; ember-rails.el
;;
;; To install:
;;   (require 'ember-rails)
;;   (global-set-key "\C-c,e" 'ember-rails-toggle-file)
;;

(defun ember-rails-toggle-file ()
  "Toggle between an ember file and its corresponding rails file."
  (interactive)
  (let (currentFile emberFile railsFile emberDir railsDir)
    (setq currentFile
          (mapconcat 'identity
                     (last (split-string buffer-file-name "/") 2) "/"))
    (setq emberFile (concat (car (split-string currentFile "[.]")) ".js.coffee"))
    (setq railsFile (concat (car (split-string currentFile "[.]")) ".rb"))
    (setq emberDir "../assets/javascripts/")
    (setq railsDir "../../../")
    (if (string-match "\.rb$" currentFile)
        (find-file-existing (concat emberDir emberFile))
        (find-file-existing (concat railsDir railsFile)))))

(provide 'ember-rails)
