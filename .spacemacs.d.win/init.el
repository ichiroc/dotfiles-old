;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     chrome
     csv
     dash
     emacs-lisp
     emacs-lisp
     evernote
     git
     helm
     html
     imenu-list
     javascript
     markdown
     noren
     octave
     (org :variables org-enable-reveal-js-support t)
     python
     react
     ruby
     ruby-on-rails
     sql
     swift
     swift
     themes-megapack
     treemacs
     vb
     windows-scripts
     yaml
     ;; spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;; (visual-basic-mode :location (recipe :fetcher wiki))
                                      ;; (aqua-all-log-mode :location local)
                                      ;; auto-save-buffers-enhanced
                                      calfw
                                      calfw-ical
                                      calfw-org
                                      csv-nav
                                      ctags-update
                                      ddskk
                                      edbi
                                      edit-server
                                      eslintd-fix
                                      highlight-indent-guides
                                      howm
                                      imenu-list
                                      japanese-holidays
                                      logview
                                      ox-pandoc
                                      ox-reveal
                                      plantuml-mode
                                      quickrun
                                      rainbow-mode
                                      rjsx-mode
                                      ruby-refactor
                                      typing
                                      wgrep
                                      yaml-mode
                                      zeal-at-point
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5
   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default nil)
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-interaction-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("TakaoGothic"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 20
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
                                         :enabled-for-modes prog-mode
                                         :size-limit-kb 200000
                                         )
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis t
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup t
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq auto-completion-return-key-behavior 'nil)
  (setq auto-completion-tab-key-behavior 'complete)

  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (server-force-delete)
  (server-start)
  ;; General
  (setq find-program "c:/tools/msys64/usr/bin/find.exe")
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  ;; フルパスのファイル名をタイトルバーに表示
  (setq frame-title-format
         (format "%%f - Emacs@%s" (system-name)))
  ;; 画面からはみ出した行を折り返さない(パフォーマンスに影響する場合がある)
  (setq default-truncate-lines t)
  ;; 右から左に流れる文字を表示しない設定。長い行が含まれる際のパフォーマンスを上げる
  ;;http://emacs.stackexchange.com/questions/598/how-do-i-prevent-extremely-long-lines-making-emacs-slow
  (setq bidi-display-reordering nil)
  (setq default-buffer-file-coding-system 'utf-8-unix)
;;  (advice-remove 'imenu-default-goto-function 'xref-push-marker-stack)
  (advice-remove 'imenu-default-goto-function '(lambda (x) (xref-push-marker-stack (point-marker))))

  ;; for Windows
  (setq process-coding-system-alist '(("[pP][lL][iI][nN][kK]" undecided-dos . undecided-dos)
                                      ("[cC][mM][dD][pP][rR][oO][xX][yY]" cp932-dos . cp932-dos)))
 (add-hook 'kill-emacs-hook '(lambda () (interactive)
                                (recentf-cleanup)
                                (recentf-save-list)))

 (when (fboundp 'ime-force-off)
    (add-hook 'evil-normal-state-entry-hook 'ime-force-off)
    (setq w32-ime-show-mode-line nil)
    )
  ;; General keybindings
  (-each '(normal visual insert motion hybrid)
    (lambda(state)
      (evil-global-set-key state (kbd "C-;") 'helm-for-files)
      ))
  (global-set-key (kbd "C-@") 'evil-normal-state)
  ;; 横分割されるとテーブルが見にくいので常に水平に分割する
  (setq split-width-threshold nil)
  (evil-global-set-key 'hybrid (kbd "C-h") 'delete-backward-char)
  (define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char)
  ;; evil 置換する際に c-b で戻れないと不便
  (define-key evil-ex-completion-map (kbd "C-b") 'backward-char)

  ;; company
  ;; (define-key company-active-map (kbd "C-n") 'company-select-next)
  ;; (define-key company-active-map (kbd "C-p") 'company-select-previous)
  ;; (define-key company-active-map (kbd "C-h") 'delete-backward-char)

  ;; org-mode
  (use-package org
    :config
    (setq org-directory "~/Documents/org")
    (setq org-agenda-files '("~/Documents/org/tasks.org"))
    (setq org-bullets-bullet-list '("■" "◆" "▲" "≫" "▶" "▷"))
    (setq org-mobile-directory (concat org-directory "/staging"))
    (setq org-mobile-inbox-for-pull (car org-agenda-files))
    (add-hook 'org-mobile-post-push-hook (lambda ()(shell-command (expand-file-name (concat org-directory "/push-mobileorg.bat")))))
    (add-hook 'org-mobile-post-pull-hooks (lambda ()(shell-command (expand-file-name (concat org-directory "/pull-mobileorg.bat")))))
    (spacemacs/set-leader-keys "C C" 'org-capture)
    (spacemacs/set-leader-keys "o c" 'org-capture)
    (spacemacs/set-leader-keys "f a" '(lambda () (interactive) (find-file (-first-item org-agenda-files))))
    (define-key org-mode-map (kbd "M-l") 'org-indent-item)
    (define-key org-mode-map (kbd "M-h") 'org-outdent-item)
    (define-key org-mode-map (kbd "C-+") 'org-priority-up)
    (define-key org-mode-map (kbd "C-=") 'org-priority-down)
    )

  ;; ox-*
  (use-package ox-reveal)
  (use-package ox-md)

  ;; org-columns
  (spacemacs/set-leader-keys-for-major-mode 'org-agenda-mode "o" 'org-agenda-columns)
  (spacemacs/set-leader-keys-for-major-mode 'org-mode "o" 'org-columns)

  ;; org clock table
  ;; http://sachachua.com/blog/2007/12/clocking-time-with-emacs-org/ を改変(各日ごとに計算を区切った)
  ;; 下のコメントを入れることで各日ごとに作業時間集計を出す
  ;; #+BEGIN: rangereport :maxlevel 4 :scope file :tags "" :tstart "<-1w>" :tend "<+1d>"
  ;; #+END:
  (defun org-dblock-write:rangereport (params)
  "Display day-by-day time reports."
  (let* ((ts (plist-get params :tstart))
         (te (plist-get params :tend))
         (start (time-to-seconds
                 (apply 'encode-time (org-parse-time-string ts))))
         (end (time-to-seconds
               (apply 'encode-time (org-parse-time-string te))))
         day-numbers)
    (setq params (plist-put params :tstart nil))
    (setq params (plist-put params :end nil))
    (while (<= start end)
      (save-excursion
        (insert "\n\n"
                (format-time-string (car org-time-stamp-formats)
                                    (seconds-to-time start))
                "----------------\n")
        (org-dblock-write:clocktable
         (plist-put
          (plist-put
           params
           :tstart
           (format-time-string (car org-time-stamp-formats)
                               (seconds-to-time start)))
          :tend
          (format-time-string (car org-time-stamp-formats)
                              (seconds-to-time (+ start 86400))))) ;; ここを改変 end -> (+ start 86400)
        (setq start (+ 86400 start))))))

  ;; org priority
  (setq org-highest-priority ?1)
  (setq org-default-priority ?5)
  (setq org-lowest-priority ?9)

  (use-package org-protocol
    :config
    (setq org-capture-templates `(
                                  ("c" "Task" entry (file+headline ,(car org-agenda-files) "Tasks")
                                   "* TODO %^{Title}\n")
                                  ("p" "Protocol" entry (file+headline ,(car org-agenda-files) "Tasks")
                                   "* TODO %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
                                  ("L" "Protocol Link" entry (file+headline ,(car org-agenda-files) "Tasks")
                                   "* TODO %? \n[[%:link][%:description]] \nCaptured On: %U")
                                  )))

  (setq org-refile-targets '((nil  :maxlevel . 6)))
  (setq org-todo-keywords
        '((sequence "TODO(t)" "WAIT(w)" "|"  "DONE(x)" "DEFFER(d)" "CANCELED(c)")))

  ;; org clock
  (global-set-key (kbd "C-c C-x C-j") 'org-clock-goto)
  (spacemacs/set-leader-keys "a o j" 'org-clock-goto)
  (defvar my-org-clock-in-shell-buffer-name "*ORG-CLOCK-IN-BUFFER*")
  (add-hook 'org-clock-in-hook
            '(lambda () (interactive)
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
  ;; 突発的な仕事を簡単に登録する。
  ;; 主にOSからのコマンドでの呼び出しを想定
  (defun my-org-capture-task ()
    (interactive)
    (raise-frame)
    (org-capture nil "c"))
  (defun my-org-capture-and-clock-in ()
    "突発的な仕事を簡単に登録してクロックインする。
主にOSからのコマンドでの呼び出しを想定
org-capture-templates の clock-in を使うとヘッドラインが空で
クロックインしてしまうので独自関数で定義"
    (interactive)
    (raise-frame)
    (org-capture nil "c")
    (org-clock-in))
  (global-set-key (kbd "C-M-l") 'my-org-capture-and-clock-in)

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

  ;; org-clock modeline
  (spacemacs/toggle-mode-line-org-clock-on)

  (defun my-org-clock-increment-property (prop-name)
    "clock in しているタスクの property をインクリメントする"
    (interactive)
    (save-excursion
      (org-clock-goto)
      (my-org-increment-property-value prop-name)
      ))

  (defun my-org-increment-property-value (prop-name)
    "org の property の数字をインクリメントする"
    (let*  ((prop-value (car (org-property--local-values prop-name t))))
      (when (eq prop-value nil) (setq prop-value "0"))
      (org-set-property prop-name (number-to-string (1+ (string-to-number prop-value))))
      ))
  ;; org-pomodoro のログ記録
  (add-hook 'org-pomodoro-started-hook  '(lambda () (interactive) (my-org-clock-increment-property "Pomodoro_Started")))
  (add-hook 'org-pomodoro-finished-hook '(lambda () (interactive) (my-org-clock-increment-property "Pomodoro_Finished")))
  (add-hook 'org-pomodoro-killed-hook   '(lambda () (interactive) (my-org-clock-increment-property "Pomodoro_Killed")))

  ;; task を完了したら自動的に org-pomodoro を finish
  (defun my-org-pomodoro-finish ()
    (interactive)
    (when (and (boundp 'org-pomodoro-state)
                (not (s-equals-p org-pomodoro-state ":pomodoro")))
      (org-pomodoro-finished)))

  ;; org-pomodoro notification
  (add-hook 'org-pomodoro-finished-hook '(lambda () (interactive)(shell-command "msg console Take a break :)")))
  (add-hook 'org-pomodoro-break-finished-hook '(lambda () (interactive) (shell-command "msg console It's time to work!")))

  ;; inf-ruby
  (setq inf-ruby-default-implementation "ruby")

  ;; objective-c
  (defun objc-pragma-imenu-create-index ()
    (let (index)
      (dolist (pattern (list "\\(^@interface.+$\\|^@implementation.+$\\|#pragma mark.+$\\|^-.+$\\|^+.+$\\)" ))
        (goto-char (point-min))
        (while (re-search-forward pattern (point-max) t)
          (push (cons (match-string 1) (match-beginning 1)) index)))
      (nreverse index)))

  (add-hook 'objc-mode-hook (lambda () (setq imenu-create-index-function 'objc-pragma-imenu-create-index)))

  ;; treemacs
  (use-package treemacs
    :config
    (setq treemacs-silent-refresh)
    )

  ;; calfw
  (use-package calfw-ical)
  (use-package calfw-org
    :config
    (defun my-open-calendar ()
      (interactive)
      (cfw:open-calendar-buffer
       :contents-sources
       (list
        (cfw:org-create-source "IndianRed")  ; orgmode source
        (cfw:ical-create-source "Private" (getenv "EMACS_CALFW_PRIVATE_CAL_URL") "sea green") ; google calendar ICS
        (cfw:ical-create-source "Work" (getenv "EMACS_CALFW_WORK_CAL_URL") "LightBlue") ; google calendar ICS
        )))
    )
  ;; holidays
  (eval-after-load "holidays"
    '(progn
       (require 'japanese-holidays)
       (setq calendar-holidays ; 他の国の祝日も表示させたい場合は適当に調整
             (append japanese-holidays holiday-local-holidays holiday-other-holidays))
       (setq mark-holidays-in-calendar t) ; 祝日をカレンダーに表示
       ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
       ;; デフォルトで設定済み
       (setq japanese-holiday-weekend '(0 6)     ; 土日を祝日として表示
             japanese-holiday-weekend-marker     ; 土曜日を水色で表示
             '(holiday nil nil nil nil nil japanese-holiday-saturday))
       (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
       (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)))
   (setq cfw:org-agenda-schedule-args '(:deadline))


   ;; ruby
   (setq ruby-deep-indent-paren nil) ;;
   ;; rails
   (projectile-rails-global-mode t)
   (defun projectile-rails-find-policy ()
     "Find a policy."
     (interactive)
     (projectile-rails-find-resource
      "policy: "
      '(("app/policies/" "/policies/\\(.+?\\)\\(_policy\\)?\\.rb$"))
      "app/policies/${filename}_policy.rb"))
   (spacemacs/set-leader-keys-for-minor-mode 'projectile-rails-mode
          "rfa" 'projectile-rails-find-locale
          "rfc" 'projectile-rails-find-controller
          "rfe" 'projectile-rails-find-environment
          "rff" 'projectile-rails-find-feature
          "rfh" 'projectile-rails-find-helper
          "rfi" 'projectile-rails-find-initializer
          "rfj" 'projectile-rails-find-javascript
          "rfl" 'projectile-rails-find-lib
          "rfm" 'projectile-rails-find-model
          "rfn" 'projectile-rails-find-migration
          "rfo" 'projectile-rails-find-log
          "rfp" 'projectile-rails-find-spec
          "rfr" 'projectile-rails-find-rake-task
          "rfs" 'projectile-rails-find-stylesheet
          "rft" 'projectile-rails-find-test
          "rfu" 'projectile-rails-find-fixture
          "rfv" 'projectile-rails-find-view
          "rfy" 'projectile-rails-find-layout
          "rf@" 'projectile-rails-find-mailer
          ;; Goto file
          "rgc" 'projectile-rails-find-current-controller
          "rgd" 'projectile-rails-goto-schema
          "rge" 'projectile-rails-goto-seeds
          "rgh" 'projectile-rails-find-current-helper
          "rgj" 'projectile-rails-find-current-javascript
          "rgg" 'projectile-rails-goto-gemfile
          "rgm" 'projectile-rails-find-current-model
          "rgn" 'projectile-rails-find-current-migration
          "rgp" 'projectile-rails-find-current-spec
          "rgr" 'projectile-rails-goto-routes
          "rgs" 'projectile-rails-find-current-stylesheet
          "rgt" 'projectile-rails-find-current-test
          "rgu" 'projectile-rails-find-current-fixture
          "rgv" 'projectile-rails-find-current-view
          "rgz" 'projectile-rails-goto-spec-helper
          "rg." 'projectile-rails-goto-file-at-point
          ;; Rails external commands
          "r:" 'projectile-rails-rake
          "rcc" 'projectile-rails-generate
          "ri" 'projectile-rails-console
          "rxs" 'projectile-rails-server
          ;; Refactoring 'projectile-rails-mode
          "rRx" 'projectile-rails-extract-region)

  ;; ddskk
  (setq skk-large-jisyo "~/skk/SKK-JISYO.L")
  (setq skk-jisyo "~/.skk-jisyo")
  (skk-preload)
  (global-set-key (kbd "C-x C-j") (lambda ()(interactive) (skk-mode t)))
  (define-key minibuffer-local-map (kbd "C-x C-j") (lambda ()(interactive) (skk-mode t)))
  (define-key evil-ex-search-keymap (kbd "C-x C-j") (lambda ()(interactive) (skk-mode t)))
  (evil-global-set-key 'hybrid (kbd "C-x C-j") (lambda ()(interactive) (skk-mode t)))
  (add-hook 'evil-normal-state-entry-hook
            '(lambda ()
               (skk-mode -1)))

  ;;zeal
  (use-package zeal-at-point
    :config
    (with-eval-after-load "zeal-at-point"
      (add-to-list 'exec-path "C:/Program Files (x86)/Zeal")
      (setq zeal-at-point-zeal-version "0.3.1")
      (setq
       zeal-at-point-mode-alist
       (remove (assoc 'ruby-mode zeal-at-point-mode-alist)
               zeal-at-point-mode-alist))
      (add-to-list 'zeal-at-point-mode-alist
                   '(ruby-mode . "rails,ruby"))))

  (defun my-skk-c-j ()
    (interactive)
    (if skk-henkan-mode
        (skk-kakutei)
      (skk-mode 1)))
  ;; C-j でひらがなモードに戻る。ただし変換中は確定にする
  (evil-global-set-key 'hybrid (kbd "C-j") 'my-skk-c-j)

  ;; helm
  (eval-after-load "helm"
    '(progn
     ;; helm-map
       ;; 動作がもたつくので org-capture では helm を有効にしない
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
       (spacemacs/set-leader-keys "s o" 'helm-occur)
       (define-key helm-map (kbd "C-M-n") 'helm-next-source)
       (define-key helm-map (kbd "C-M-p") 'helm-previous-source)
       (define-key helm-map (kbd "C-h") 'delete-backward-char)
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
       (setq helm-truncate-lines t)     ; 長い候補を折り返すと遅くなるので折り返しOFF
     ))
  (eval-after-load "helm-files"
    '(progn
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
       (define-key helm-find-files-map (kbd "C-h") 'helm-ff-delete-char-backward)
       (define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)))
  (eval-after-load "helm-org"
    '(progn
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
       ))
  (eval-after-load "helm-mode"
    '(progn
       (add-to-list 'helm-completing-read-handlers-alist '(org-capture . nil))
       (add-to-list 'helm-completing-read-handlers-alist '(dired-do-copy . nil))
       ))
  ;;helm-find-file だと UNC が打てないので、C-f でノーマルな find-file になれる find-file に変更
  (spacemacs/set-leader-keys "f F" 'find-file)

  ;;mc/mark
  (evil-global-set-key 'visual (kbd "C-*") 'mc/mark-all-like-this-dwim)
  (evil-global-set-key 'visual (kbd "M-*") 'mc/mark-all-symbols-like-this-in-defun)
  (evil-global-set-key 'visual (kbd "C-<") 'mc/mark-previous-like-this)
  (evil-global-set-key 'visual (kbd "C->") 'mc/mark-next-like-this)
  (evil-global-set-key 'visual (kbd "C-M-<") 'mc/skip-to-previous-like-this)
  (evil-global-set-key 'visual (kbd "C-M->") 'mc/skip-to-next-like-this)
  (evil-global-set-key 'visual (kbd "C-S-SPC") 'mc/skip-to-next-like-this)

  ;; google-translate
  (spacemacs/set-google-translate-languages "en" "ja")
  ;; yas
  (evil-global-set-key 'hybrid (kbd "M-i") 'yas-expand)

  ;; Oracle
  ;; (setenv "NLS_LANG" "JAPANESE_JAPAN.JA16SJISTILDE")
  (autoload 'sqlplus "sqlplus" nil t)
  (defadvice sql-oracle (after set-coding-sql-oracle activate)
    (set-process-coding-system (get-process "SQL") 'cp932 'cp932)
    )
  (setenv "NLS_LANG" "AMERICAN_JAPAN.UTF8")
  ;; 2回目にedbiを実行するとブランクになる問題を回避
  (defadvice edbi:dbview-quit-command (after my-edbi:dbview-clear-semaphore activate)
    (edbi:dbview-query-execute-semaphore-clear)
    (message "Clear edbi:dbview semaphore")
    )
  (setq edbi:query-result-fix-header nil)

  ;; sql
  (with-eval-after-load 'sql
    (require 'sql-indent))

  ;; 一時ファイルを .cache へ移動
  (setq edbi:ds-history-file "~/.emacs.d/.cache/.edbi-ds-history")
  (setq mc/list-file "~/.emacs.d/.cache/.mc-lists.el")
  (setq recentf-save-file "~/.emacs.d/.cache/recentf")
  (setq image-dired-dir "~/.emacs.d/.cache/image-dired")

  ;; Local file
  (add-to-list 'file-coding-system-alist '("[T]F0004KE\\'" . cp932-dos))
  (add-to-list 'file-coding-system-alist '("aquaAll[0-9]\\.log.*" . cp932-dos))

  ;; javascript js2, jsx
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.es6?\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.js.erb?\\'" . rjsx-mode))
  (setq js2-strict-missing-semi-warning nil)

;;  (setq paradox-github-token "574b93aa47024de1894a550e93cd0d69f8f89c06")
  (setq paradox-github-token nil)
  ;; visual-basic
  (add-to-list 'auto-mode-alist '("\\.vbs?" . visual-basic-mode))

  ;; aqua log
  (autoload 'aqua-all-log-mode "aqua-all-log-mode" "\
View mode for aquaAll.log
\(fn)" t nil)

  ;; doc-view-mode
  (defvar doc-view-ghostscript-program "c:/Program Files/gs/gs9.20/bin/gswin64.exe")
  (defvar doc-view-odf->pdf-converter-program "c:/Program Files/LibreOffice 5/program/soffice.exe")

  ;; geeknote
  (setq geeknote-command "c:/tools/Python27/Scripts/geeknote.exe")
  ;; spacemacs はデフォルトが utf-8 になっているので、 (set-default-process-coding-system) を再実行して
  ;; 自動判定 (undecided-dos . undecided-unix)  に変更
  (set-default-process-coding-system)

  ;; markdown
  (setq markdown-command "pandoc")
  ;; yasnippet に変更
  ;; (sp-local-pair 'markdown-mode "```" "```")
  (add-to-list 'auto-mode-alist '("\\.md\\.txt" . markdown-mode))
  (spacemacs/set-leader-keys-for-major-mode 'markdown-mode (kbd "n") 'mmm-narrow-to-submode-region)


  (with-eval-after-load "mmm-mode"
    ;; markdown で mmm-mode をまとめて定義する
    (-each '(
             "css"
             "scss"
             "sass"
             "coffee"
             "dos"
             "emacs-lisp"
             "gtags"
             "haml"
             "html"
             "html-erb"
             "js2"
             "javascript"
             "lisp"
             "objc"
             "plantuml"
             "sass"
             "sh"
             "sql"
             "swift"
             "web"
             "yaml"
             )
      '(lambda (mode-name)
         (let ((md-class (intern (concat "markdown-" mode-name))))
           (mmm-add-classes
            (list (list md-class
                        :submode (intern (concat mode-name "-mode"))
                        :face 'mmm-declaration-submode-face
                        :front (concat "^```" mode-name "[\n]+")
                        :back "^```$")))
           (mmm-add-mode-ext-class 'markdown-mode nil md-class)
           )))
    ;; ruby でSQLを色づけする
    (mmm-add-classes '((ruby-sql-class
                       :submode sql-mode
                       :face 'mmm-declaration-submode-face
                       :front "<<[-~]?[\"']?SQL[\"']?.*"
                       :back "SQL"
                        )))
    (mmm-add-mode-ext-class 'ruby-mode nil 'ruby-sql-class)
    ;; ruby で JS を色づけする
    (mmm-add-classes '((ruby-js-class
                        :submode js2-mode
                        :face 'mmm-declaration-submode-face
                        :front "<<[-~]?[\"']?JS[\"']?.*"
                        :back "JS"
                        )))
    (mmm-add-mode-ext-class 'ruby-mode nil 'ruby-js-class)
    )

  ;; howm
  ;; keybind "w" is Wiki
  (require 'howm)
  (spacemacs/set-leader-keys "a w w" 'howm-create)
  (spacemacs/set-leader-keys "a w m" 'howm-menu)
  (spacemacs/set-leader-keys "a w g" 'howm-list-grep)
  (spacemacs/set-leader-keys "a w a" 'howm-list-all)
  (spacemacs/set-leader-keys "a w l" 'howm-list-recent)
  (spacemacs/set-leader-keys "a w q" 'howm-kill-all)
  (evil-make-overriding-map howm-mode-map 'normal)
  (evil-make-overriding-map howm-view-summary-mode-map 'normal)
  (evil-make-overriding-map howm-menu-mode-map 'normal)
  (evil-make-overriding-map howm-view-contents-mode-map 'normal)
  (add-to-list 'auto-mode-alist (cons (concat (expand-file-name howm-directory ) ".*") 'markdown-mode))
  (setq howm-view-grep-command "grep")

  ;; 現在のカーソル位置にURLのテキストをマークダウン形式にして挿入する
  ;; pandocが必須
  (defun my-insert-markdown-from-url (url)
     (interactive "sURL: ")
     (let ((markdown-text))
       (with-temp-buffer
         (shell-command (concat "pandoc --wrap=none -f html -t markdown " url)
                        (current-buffer))
         (setq markdown-text (buffer-string)))
       (insert markdown-text)))

  ;; python
  (remove-hook 'python-mode-hook 'anaconda-mode)
  (remove-hook 'python-mode-hook 'anaconda-eldoc-mode)

  ;;plantuml
  (setq plantuml-jar-path "c:/tools/plantuml/plantuml.jar")
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(company-idle-delay 0.8)
 '(edit-server-new-frame-alist
   (quote
    ((name . "Edit with Emacs FRAME")
     (width . 156)
     (height . 59)
     (minibuffer . t)
     (menu-bar-lines . t))))
 '(evil-want-Y-yank-to-eol nil)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-strict-trailing-comma-warning nil)
 '(logview-additional-submodes
   (quote
    (("AquaAllLog"
      (format . "NAME TIMESTAMP,THREAD LEVEL  :")
      (levels . "SLF4J")
      (timestamp)
      (aliases)))))
 '(magit-git-executable "c:/Program Files/Git/bin/git.exe")
 '(magit-git-output-coding-system (quote utf-8))
 '(markdown-list-indent-width 2)
 '(neo-autorefresh t)
 '(org-agenda-custom-commands
   (quote
    (("a" "Agenda for a week from today and Todays task."
      ((agenda ""
               ((org-agenda-overriding-header "スケジュールされたタスク、デッドライン間近のタスク")
                (org-agenda-start-on-weekday nil)
                (org-agenda-sorting-strategy
                 (quote
                  (deadline-up scheduled-up)))))
       (todo "TODO"
             ((org-agenda-sorting-strategy
               (quote
                (priority-down)))
              (org-agenda-overriding-header "本日やるタスク"))))
      nil)
     ("o" "List of all TODO entry ( only \"TODO\" )" todo "TODO" nil)
     ("t" "List of all TODO entry ( only \"TODO\" )" todo "TODO" nil)
     ("w" "List of all WAIT entry" todo "WAIT" nil))))
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
 '(org-columns-default-format
   "%8 %3PRIORITY %67ITEM %15DEADLINE %CLOCKSUM %13TAGS %Effort{:}")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-hierarchical-todo-statistics nil)
 '(org-provide-todo-statistics (quote all-headlines))
 '(org-reveal-history t)
 '(org-reveal-root "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.3.0/")
 '(org-reveal-single-file nil)
 '(org-reveal-theme "white")
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (org-projectile-helm "org" ctags-update helm-rdefs github-browse-file calfw-org calfw-ical org-category-capture eslintd-fix ruby-refactor helm-robe ac-html-bootstrap git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck diff-hl auto-dictionary neotree ox-pandoc ht flymake-jshint magithub codic rjsx-mode winum solarized-theme diminish packed package-build wgrep auto-save-buffers-enhanced rainbow-mode utop tuareg caml ocp-indent merlin plantuml-mode logview datetime log4j-mode powerline spinner autothemer bind-key highlight bind-map highlight-indent-guides minitest hide-comnt quickrun howm yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic geeknote ox-reveal pcache hydra projectile iedit anzu smartparens evil undo-tree helm helm-core avy async f s helm-dash powershell zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme enh-ruby-mode edbi epc ctable concurrent ddskk cdb calfw zeal-at-point yaml-mode typing japanese-holidays imenu-list deferred ccc csv-nav google-maps orgit magit-gitflow evil-magit magit magit-popup web-mode web-beautify visual-basic-mode tagedit swift-mode sql-indent smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv pug-mode projectile-rails rake inflections org-projectile org-present org org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc htmlize helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode gnuplot gmail-message-mode ham-mode markdown-mode html-to-markdown gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md feature-mode git-commit with-editor dash emmet-mode edit-server csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company coffee-mode chruby bundler inf-ruby auto-yasnippet yasnippet ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(paradox-github-token t)
 '(rubocop-check-command "rubocop --format emacs -D -S -R")
 '(ruby-insert-encoding-magic-comment nil)
 '(visual-basic-mode-indent 2)
 '(web-mode-attr-value-indent-offset nil)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(company-idle-delay 0.8)
 '(edit-server-new-frame-alist
   (quote
    ((name . "Edit with Emacs FRAME")
     (width . 156)
     (height . 59)
     (minibuffer . t)
     (menu-bar-lines . t))))
 '(evil-want-Y-yank-to-eol nil)
 '(imenu-auto-rescan t)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-strict-trailing-comma-warning nil)
 '(logview-additional-submodes
   (quote
    (("AquaAllLog"
      (format . "NAME TIMESTAMP,THREAD LEVEL  :")
      (levels . "SLF4J")
      (timestamp)
      (aliases)))))
 '(magit-git-executable "c:/Program Files/Git/bin/git.exe")
 '(magit-git-output-coding-system (quote utf-8))
 '(markdown-list-indent-width 2)
 '(neo-autorefresh t)
 '(org-agenda-custom-commands
   (quote
    (("a" "Agenda for a week from today and Todays task."
      ((agenda ""
               ((org-agenda-overriding-header "スケジュールされたタスク、デッドライン間近のタスク")
                (org-agenda-start-on-weekday nil)
                (org-agenda-sorting-strategy
                 (quote
                  (deadline-up scheduled-up)))))
       (todo "TODO"
             ((org-agenda-sorting-strategy
               (quote
                (priority-down)))
              (org-agenda-overriding-header "本日やるタスク"))))
      nil)
     ("o" "List of all TODO entry ( only \"TODO\" )" todo "TODO" nil)
     ("t" "List of all TODO entry ( only \"TODO\" )" todo "TODO" nil)
     ("w" "List of all WAIT entry" todo "WAIT" nil))))
 '(org-agenda-dim-blocked-tasks nil)
 '(org-agenda-skip-deadline-prewarning-if-scheduled (quote pre-scheduled))
 '(org-columns-default-format
   "%8 %3PRIORITY %67ITEM %15DEADLINE %CLOCKSUM %13TAGS %Effort{:}")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-hierarchical-todo-statistics nil)
 '(org-provide-todo-statistics (quote all-headlines))
 '(org-reveal-history t)
 '(org-reveal-root "https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.3.0/")
 '(org-reveal-single-file nil)
 '(org-reveal-theme "white")
 '(org-startup-indented t)
 '(package-selected-packages
   (quote
    (treemacs-projectile treemacs-evil treemacs pfuture org-projectile-helm "org" ctags-update helm-rdefs github-browse-file calfw-org calfw-ical org-category-capture eslintd-fix ruby-refactor helm-robe ac-html-bootstrap git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck diff-hl auto-dictionary neotree ox-pandoc ht flymake-jshint magithub codic rjsx-mode winum solarized-theme diminish packed package-build wgrep auto-save-buffers-enhanced rainbow-mode utop tuareg caml ocp-indent merlin plantuml-mode logview datetime log4j-mode powerline spinner autothemer bind-key highlight bind-map highlight-indent-guides minitest hide-comnt quickrun howm yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic geeknote ox-reveal pcache hydra projectile iedit anzu smartparens evil undo-tree helm helm-core avy async f s helm-dash powershell zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme enh-ruby-mode edbi epc ctable concurrent ddskk cdb calfw zeal-at-point yaml-mode typing japanese-holidays imenu-list deferred ccc csv-nav google-maps orgit magit-gitflow evil-magit magit magit-popup web-mode web-beautify visual-basic-mode tagedit swift-mode sql-indent smeargle slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv pug-mode projectile-rails rake inflections org-projectile org-present org org-pomodoro alert log4e gntp org-download mmm-mode markdown-toc livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc htmlize helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode gnuplot gmail-message-mode ham-mode markdown-mode html-to-markdown gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md feature-mode git-commit with-editor dash emmet-mode edit-server csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company coffee-mode chruby bundler inf-ruby auto-yasnippet yasnippet ac-ispell auto-complete ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spacemacs-theme spaceline restart-emacs request rainbow-delimiters quelpa popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(paradox-github-token t t)
 '(rubocop-check-command "rubocop --format emacs -D -S -R")
 '(ruby-insert-encoding-magic-comment nil)
 '(visual-basic-mode-indent 2)
 '(web-mode-attr-value-indent-offset nil)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
