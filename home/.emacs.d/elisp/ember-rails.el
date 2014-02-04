;; ember-rails.el
;;
;; To install:
;;   (require 'ember-rails)
;;   (global-set-key "\C-c,e" 'ember-rails-toggle-file)
;;

(defun ember-rails-toggle-file ()
  "Toggle between an ember file and its corresponding rails file."
  (interactive)
  (setq currentFile
        (mapconcat 'identity
                   (last (split-string buffer-file-name "/") 2) "/"))
  (setq currentFileDir
        (replace-regexp-in-string "[\._[:alnum:]]*$" "" buffer-file-name))
  (setq isInRails (string-match "\.rb$" currentFile))
  (setq targetFile (concat (car (split-string currentFile "[.]"))
                           (if isInRails ".js.coffee" ".rb")))
  (setq targetDir (make-list 1 (file-truename
                                (concat currentFileDir
                                        (if isInRails
                                            "../assets/javascripts"
                                          "../../..")))))
  (setq locatedTargetFile (locate-file targetFile targetDir))
  (if locatedTargetFile
      (find-file-existing locatedTargetFile)
    (error (concat "Can't find " targetFile " in " (car targetDir)))))

(provide 'ember-rails)
