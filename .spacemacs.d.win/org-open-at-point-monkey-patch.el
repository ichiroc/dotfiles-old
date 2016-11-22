(defun org-open-at-point (&optional arg reference-buffer)
  "Open link, timestamp, footnote or tags at point.

When point is on a link, follow it.  Normally, files will be
opened by an appropriate application.  If the optional prefix
argument ARG is non-nil, Emacs will visit the file.  With
a double prefix argument, try to open outside of Emacs, in the
application the system uses for this file type.

When point is on a timestamp, open the agenda at the day
specified.

When point is a footnote definition, move to the first reference
found.  If it is on a reference, move to the associated
definition.

When point is on a headline, display a list of every link in the
entry, so it is possible to pick one, or all, of them.  If point
is on a tag, call `org-tags-view' instead.

When optional argument REFERENCE-BUFFER is non-nil, it should
specify a buffer from where the link search should happen.  This
is used internally by `org-open-link-from-string'.

On top of syntactically correct links, this function will open
the link at point in comments or comment blocks and the first
link in a property drawer line."
  (interactive "P")
  ;; On a code block, open block's results.
  (unless (call-interactively 'org-babel-open-src-block-result)
    (org-load-modules-maybe)
    (setq org-window-config-before-follow-link (current-window-configuration))
    (org-remove-occur-highlights nil nil t)
    (unless (run-hook-with-args-until-success 'org-open-at-point-functions)
      (let* ((context
              ;; Only consider supported types, even if they are not
              ;; the closest one.
              (org-element-lineage
               (org-element-context)
               '(clock comment comment-block footnote-definition
                       footnote-reference headline inlinetask keyword link
                       node-property timestamp)
               t))
             (type (org-element-type context))
             (value (org-element-property :value context)))
        (cond
         ((not context) (user-error "No link found"))
         ;; Exception: open timestamps and links in properties
         ;; drawers, keywords and comments.
         ((memq type '(comment comment-block keyword node-property))
          (cond ((org-in-regexp org-any-link-re)
                 (org-open-link-from-string (match-string-no-properties 0)))
                ((or (org-in-regexp org-ts-regexp-both nil t)
                     (org-in-regexp org-tsr-regexp-both nil t))
                 (org-follow-timestamp-link))
                (t (user-error "No link found"))))
         ;; On a headline or an inlinetask, but not on a timestamp,
         ;; a link, a footnote reference or on tags.
         ((and (memq type '(headline inlinetask))
               ;; Not on tags.
               (progn (save-excursion (beginning-of-line)
                                      (looking-at org-complex-heading-regexp))
                      (or (not (match-beginning 5))
                          (< (point) (match-beginning 5)))))
          (let* ((data (org-offer-links-in-entry (current-buffer) (point) arg))
                 (links (car data))
                 (links-end (cdr data)))
            (if links
                (dolist (link (if (stringp links) (list links) links))
                  (search-forward link nil links-end)
                  (goto-char (match-beginning 0))
                  (org-open-at-point))
              (require 'org-attach)
              (org-attach-reveal 'if-exists))))
         ;; On a clock line, make sure point is on the timestamp
         ;; before opening it.
         ((and (eq type 'clock)
               value
               (>= (point) (org-element-property :begin value))
               (<= (point) (org-element-property :end value)))
          (org-follow-timestamp-link))
         ;; Do nothing on white spaces after an object.
         ((>= (point)
              (save-excursion
                (goto-char (org-element-property :end context))
                (skip-chars-backward " \t")
                (point)))
          (user-error "No link found"))
         ((eq type 'timestamp) (org-follow-timestamp-link))
         ;; On tags within a headline or an inlinetask.
         ((and (memq type '(headline inlinetask))
               (progn (save-excursion (beginning-of-line)
                                      (looking-at org-complex-heading-regexp))
                      (and (match-beginning 5)
                           (>= (point) (match-beginning 5)))))
          (org-tags-view arg (substring (match-string 5) 0 -1)))
         ((eq type 'link)
          ;; When link is located within the description of another
          ;; link (e.g., an inline image), always open the parent
          ;; link.
          (let*((link (let ((up (org-element-property :parent context)))
                        (if (eq (org-element-type up) 'link) up context)))
                (type (org-element-property :type link))
                (path (org-link-unescape (org-element-property :path link))))
            ;; Switch back to REFERENCE-BUFFER needed when called in
            ;; a temporary buffer through `org-open-link-from-string'.
            (with-current-buffer (or reference-buffer (current-buffer))
              (cond
               ((equal type "file")
                (if (string-match "[*?{]" (file-name-nondirectory path))
                    (dired path)
                  ;; Look into `org-link-protocols' in order to find
                  ;; a DEDICATED-FUNCTION to open file.  The function
                  ;; will be applied on raw link instead of parsed
                  ;; link due to the limitation in `org-add-link-type'
                  ;; ("open" function called with a single argument).
                  ;; If no such function is found, fallback to
                  ;; `org-open-file'.
                  ;;
                  ;; Note : "file+emacs" and "file+sys" types are
                  ;; hard-coded in order to escape the previous
                  ;; limitation.
                  (let* ((option (org-element-property :search-option link))
                         (app (org-element-property :application link))
                         (dedicated-function
                          (nth 1 (assoc app org-link-protocols))))
                    (if dedicated-function
                        (funcall dedicated-function
                                 (concat path
                                         (and option (concat "::" option))))
                      (apply #'org-open-file
                             path
                             (cond (arg)
                                   ((equal app "emacs") 'emacs)
                                   ((equal app "sys") 'system))
                             (cond ((not option) nil)
                                   ((org-string-match-p "\\`[0-9]+\\'" option)
                                    (list (string-to-number option)))
                                   (t (list nil
                                            (org-link-unescape option)))))))))
               ((assoc type org-link-protocols)
                (funcall (nth 1 (assoc type org-link-protocols)) path))
               ((equal type "help")
                (let ((f-or-v (intern path)))
                  (cond ((fboundp f-or-v) (describe-function f-or-v))
                        ((boundp f-or-v) (describe-variable f-or-v))
                        (t (error "Not a known function or variable")))))
               ((member type '("http" "https" "ftp" "mailto" "news" "outlook"))
                (browse-url (org-link-escape-browser (concat type ":" path))))
               ((equal type "doi")
                (browse-url
                 (org-link-escape-browser (concat org-doi-server-url path))))
               ((equal type "message") (browse-url (concat type ":" path)))
               ((equal type "shell")
                (let ((buf (generate-new-buffer "*Org Shell Output*"))
                      (cmd path))
                  (if (or (and (org-string-nw-p
                                org-confirm-shell-link-not-regexp)
                               (string-match
                                org-confirm-shell-link-not-regexp cmd))
                          (not org-confirm-shell-link-function)
                          (funcall org-confirm-shell-link-function
                                   (format "Execute \"%s\" in shell? "
                                           (org-add-props cmd nil
                                             'face 'org-warning))))
                      (progn
                        (message "Executing %s" cmd)
                        (shell-command cmd buf)
                        (when (featurep 'midnight)
                          (setq clean-buffer-list-kill-buffer-names
                                (cons (buffer-name buf)
                                      clean-buffer-list-kill-buffer-names))))
                    (user-error "Abort"))))
               ((equal type "elisp")
                (let ((cmd path))
                  (if (or (and (org-string-nw-p
                                org-confirm-elisp-link-not-regexp)
                               (org-string-match-p
                                org-confirm-elisp-link-not-regexp cmd))
                          (not org-confirm-elisp-link-function)
                          (funcall org-confirm-elisp-link-function
                                   (format "Execute \"%s\" as elisp? "
                                           (org-add-props cmd nil
                                             'face 'org-warning))))
                      (message "%s => %s" cmd
                               (if (eq (string-to-char cmd) ?\()
                                   (eval (read cmd))
                                 (call-interactively (read cmd))))
                    (user-error "Abort"))))
               ((equal type "id")
                (require 'org-id)
                (funcall (nth 1 (assoc "id" org-link-protocols)) path))
               ((member type '("coderef" "custom-id" "fuzzy" "radio"))
                (unless (run-hook-with-args-until-success
                         'org-open-link-functions path)
                  (if (not arg) (org-mark-ring-push)
                    (switch-to-buffer-other-window
                     (org-get-buffer-for-internal-link (current-buffer))))
                  (let ((destination
                         (org-with-wide-buffer
                          (if (equal type "radio")
                              (org-search-radio-target
                               (org-element-property :path link))
                            (org-link-search
                             (if (member type '("custom-id" "coderef"))
                                 (org-element-property :raw-link link)
                               path)
                             ;; Prevent fuzzy links from matching
                             ;; themselves.
                             (and (equal type "fuzzy")
                                  (+ 2 (org-element-property :begin link)))))
                          (point))))
                    (unless (and (<= (point-min) destination)
                                 (>= (point-max) destination))
                      (widen))
                    (goto-char destination))))
               (t (browse-url-at-point))))))
         ;; On a footnote reference or at a footnote definition's label.
         ((or (eq type 'footnote-reference)
              (and (eq type 'footnote-definition)
                   (save-excursion
                     ;; Do not validate action when point is on the
                     ;; spaces right after the footnote label, in
                     ;; order to be on par with behaviour on links.
                     (skip-chars-forward " \t")
                     (let ((begin
                            (org-element-property :contents-begin context)))
                       (if begin (< (point) begin)
                         (= (org-element-property :post-affiliated context)
                            (line-beginning-position)))))))
          (org-footnote-action))
         (t (user-error "No link found")))))
    (run-hook-with-args 'org-follow-link-hook)))
