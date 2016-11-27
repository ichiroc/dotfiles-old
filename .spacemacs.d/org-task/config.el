(defvar my-org-default-task-file "~/Documents/org/tasks.org")

;; org-mode
(setq org-bullets-bullet-list '("■" "◆" "▲" "≫" "▶" "▷"))

;; org priority
(setq org-highest-priority ?1)
(setq org-default-priority ?5)
(setq org-lowest-priority ?9)

(require 'org-protocol)
(setq org-capture-templates `(
                              ("c" "Task" entry (file+headline my-org-default-task-file "Inbox")
                               "* TODO %^{Title}\n")
                              ("p" "Protocol" entry (file+headline my-org-default-task-file "Inbox")
                               "* TODO %?%a")
                              ))
(setq org-refile-targets '((nil  :maxlevel . 6)))

(setq org-agenda-files (list my-org-default-task-file ))
(setq org-todo-keywords
      '((sequence "TODO(t)" "WAIT(w)" "|" "DEFFER(d)" "CANCELED(c)" "DONE(x)")))



;; org-clock modeline
;;(spacemacs/toggle-mode-line-org-clock-on)

;; org-pomodoro のログ記録
(add-hook 'org-pomodoro-started-hook '(lambda () (interactive) (my-org-clock-increment-property "Pomodoro_Started")))
(add-hook 'org-pomodoro-finished-hook '(lambda () (interactive) (my-org-clock-increment-property "Pomodoro_Finished")))
(add-hook 'org-pomodoro-killed-hook '(lambda () (interactive) (my-org-clock-increment-property "Pomodoro_Killed")))

;; task を完了したら自動的に org-pomodoro を finish
(add-hook 'org-after-todo-state-change-hook '(lambda () (interactive)
                                               (when (-contains? org-done-keywords org-state)
                                                 (org-pomodoro-finished)
                                                 )))

;; org-pomodoro notification
(add-hook 'org-pomodoro-finished-hook '(lambda () (interactive)(shell-command "msg console Take a break :)")))
(add-hook 'org-pomodoro-break-finished-hook '(lambda () (interactive) (shell-command "msg console It's time to work!")))

;; Windows用設定
(when (eq system-type 'windows-nt)
  ;; for org-protocol outlook
  ;; outlook もリンクできるようにする
  (load-file "~/.spacemacs.d/org-open-at-point-monkey-patch.el")
  (add-to-list 'org-link-types "outlook")
  (setq org-link-types-re
        "\\`\\(outlook\\|b\\(?:bdb\\|ibtex\\)\\|do\\(?:cview\\|i\\)\\|elisp\\|f\\(?:ile\\(?:\\+\\(?:\\(?:emac\\|sy\\)s\\)\\)?\\|tp\\)\\|gnus\\|h\\(?:elp\\|ttps?\\)\\|i\\(?:nfo\\|rc\\)\\|m\\(?:ailto\\|\\(?:essag\\|h\\)e\\)\\|news\\|orgit\\(?:-\\(?:log\\|rev\\)\\)?\\|\\(?:rmai\\|shel\\)l\\):")

  ;; org clock
  (defvar my-org-clock-in-shell-buffer-name "*ORG-CLOCK-IN-BUFFER*")
  (add-hook 'org-clock-in-hook '(lambda () (interactive)
                                  (async-shell-command (concat "taskviewer"
                                                               " \""
                                                               (format-time-string "[%H:%M] " org-clock-start-time)
                                                               (encode-coding-string org-clock-heading 'cp932)
                                                               "\" "
                                                               (number-to-string (- (display-pixel-height) 160))
                                                               " "
                                                               (number-to-string (- (display-pixel-width)  420)))
                                                       (get-buffer-create my-org-clock-in-shell-buffer-name))
                                  (delete-other-windows)))
  (defun my-org-clock-kill-taskviewer ()
    (interactive)
    (shell-command "taskkill /im:taskviewer.exe")
    (let ((clock-process-buffer (get-buffer my-org-clock-in-shell-buffer-name)))
      (with-timeout (10 (kill-buffer clock-process-buffer))
        (while (process-live-p
                (get-buffer-process clock-process-buffer))
          (sleep-for 1)))
      (kill-buffer clock-process-buffer))
    )
  (add-hook 'org-clock-out-hook 'my-org-clock-kill-taskviewer)
  (add-hook 'org-clock-cancel-hook 'my-org-clock-kill-taskviewer)
  )
