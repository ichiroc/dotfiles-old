(spacemacs/set-leader-keys "C C" 'org-capture)
(spacemacs/set-leader-keys "o c" 'org-capture)
(spacemacs/set-leader-keys "f a" '(lambda () (interactive) (find-file (-first-item org-agenda-files))))

;; org-columns
(spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode "o" 'org-agenda-columns)
(spacemacs/set-leader-keys-for-major-mode 'org-mode "o" 'org-columns)


;; org clock
(global-set-key (kbd "C-c C-x C-j") 'org-clock-goto)
(spacemacs/set-leader-keys "a o j" 'org-clock-goto)
