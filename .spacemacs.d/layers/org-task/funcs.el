;; clock in しているタスクの property をインクリメントする
(defun my-org-clock-increment-property (prop-name)
  (interactive)
  (save-excursion
    (org-clock-goto)
    (my-org-increment-property-value prop-name)
    ))

;; org の property の数字をインクリメントする
(defun my-org-increment-property-value (prop-name)
  (let*  ((prop-value (car (org-property--local-values prop-name t))))
    (when (eq prop-value nil) (setq prop-value "0"))
    (org-set-property prop-name (number-to-string (1+ (string-to-number prop-value))))
    ))
