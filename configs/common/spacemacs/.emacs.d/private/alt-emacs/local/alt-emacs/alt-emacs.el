(setq alt-conn
      (open-network-stream
       "alt-conn"
       "*alt-conn*"
       "127.0.0.1"
       7332))

(set-process-query-on-exit-flag alt-conn nil)

(defun alt--is-open-p ()
  (eq 'open (process-status alt-conn)))

(defun alt--send-event (event)
  (when (alt--is-open-p)
    (process-send-string alt-conn (concat event "\n"))))

(defun alt--send-event-on (event)
  (alt--send-event (concat event ":on")))

(defun alt--send-event-off (event)
  (alt--send-event (concat event ":off")))

;; ---------------------------------------

(defun alt--ivy-on-hook (orig-fun &rest args)
  (alt--send-event-on "ivy"))

(defun alt--ivy-off-hook ()
  (alt--send-event-off "ivy"))

;; add the hooks
(advice-add 'ivy-read :before 'alt--ivy-on-hook)
(advice-add 'ivy--cleanup :after 'alt--ivy-off-hook)

(provide 'alt-emacs)
