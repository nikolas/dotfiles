;; ember-rails.el
;;
;; To install:
;;   (require 'ember-rails)
;;   (global-set-key "\C-c,e" 'ember-rails-toggle-file)
;;

(defun ember-rails-toggle-file ()
  "Toggle between an ember file and its corresponding rails file."
  (interactive)
  (let (currentFile currentFileDir emberFile railsFile emberDir railsDir)
    (setq currentFile
          (mapconcat 'identity
                     (last (split-string buffer-file-name "/") 2) "/"))
    (setq currentFileDir
          (replace-regexp-in-string "[\._[:alnum:]]*$" "" buffer-file-name))
    (setq isInRails (if (string-match "\.rb$" currentFile) t nil))
    (setq targetFile (if isInRails
                         (concat
                          (car (split-string currentFile "[.]")) ".js.coffee")
                       (concat (car (split-string currentFile "[.]")) ".rb")))
    (setq targetDir (if isInRails
                        (make-list 1 (file-truename
                                      (concat
                                       currentFileDir
                                       "../assets/javascripts/")))
                      (make-list 1 (file-truename
                                    (concat currentFileDir "../../../")))))
    (setq locatedTargetFile (locate-file targetFile targetDir))
    (if locatedTargetFile
        (find-file-existing locatedTargetFile)
      (error (concat "Can't find " targetFile " in " (car targetDir))))))

(provide 'ember-rails)
