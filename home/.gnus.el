;; (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
;; (gnus-demon-add-handler 'gnus-demon-scan-news 2 t)

(setq gnus-select-method '(nntp "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nnml ""))
(setq mail-sources '((pop :server "fencepost.gnu.org"
                          :user "nikolas"
                          :authentication 'apop
                          :connection ssl
                          :port 995)))

;; (setq read-mail-command 'gnus)
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("fencepost.gnu.org" 587 nil nil))
      smtpmail-auth-credentials '(("fencepost.gnu.org" 587
           "nikolas" nil))
      smtpmail-default-smtp-server "fencepost.gnu.org"
      smtpmail-smtp-server "fencepost.gnu.org"
      smtpmail-smtp-service 587)

(setq mail-host-address "gnu.org")
(setq user-mail-address "nikolas@gnu.org")
(setq user-full-name "Nik Nyby")
