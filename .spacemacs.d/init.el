;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
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
   dotspacemacs-configuration-layer-path '("~/.spacemacs.d/layers/")
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     swift
     csv
     python
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     dash
     imenu-list
     helm
     emacs-lisp
     git
     markdown
     org
     org-task
     ruby-on-rails
     (ruby :variables ruby-enable-enh-ruby-mode nil) ;;; mmm-mode と相性が悪いの enh-ruby-mode は無効化
     javascript
     html
     react
     yaml
     evernote
     chrome
     themes-megapack
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ag
                                      coffee-mode
                                      ;; ddskk
                                      edbi
                                      string-inflection
                                      flycheck-plantuml
                                      ;; helm-dash
                                      helm-robe
                                      highlight-indent-guides
                                      howm
                                      rjsx-mode
                                      ;; lispxmp
                                      ox-gfm
                                      ox-pandoc
                                      ox-qmd
                                      ox-reveal
                                      plantuml-mode
                                      quickrun
                                      rainbow-mode
                                      swift
                                      wgrep
                                      yari
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; (default nil)
   dotspacemacs-startup-lists '(projects recents bookmarks)
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'lisp-interaction-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Ricty Diminished for Powerline"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
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
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
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
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.2
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
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
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
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
   dotspacemacs-line-numbers '(:relative t)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'all
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (setq auto-completion-tab-key-behavior 'complete)
  (setq auto-completion-return-key-behavior 'complete)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; General
  (setq default-truncate-lines t)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'meta)
  (setq max-lisp-eval-depth 2000)
  (setq frame-title-format
        (format "%%f - Emacs@%s" (system-name)))
  (setq bidi-display-reordering nil)
  (smartparens-global-mode t)

  ;; emacs-macの時だけ normal state に入ったらIMEをオフにする
  (defun my-mac-select-ascii-input-source ()
    (mac-select-input-source "com.google.inputmethod.Japanese.Roman"))
    ;; (mac-select-input-source "com.apple.inputmethod.Kotoeri.Roman"))
  (when (functionp 'mac-select-input-source)
    (add-hook 'evil-normal-state-entry-hook
              'my-mac-select-ascii-input-source
              ))

  ;; Indent mode (vertical highlight)
  (add-hook 'prog-mode-hook '(lambda () (highlight-indent-guides-mode t)))
  (setq indent-guide-delay 1)
  ;; t にすると起動時に Error running timer: (error "Variable binding depth exceeds max-specpdl-size")となり indent-guide-mode が機能しない
  ;; (setq indent-guide-recursive t)

  ;; ;; :w を :wm としてしまうので新たにマップ
  ;;(add-to-list 'evil-ex-commands '("wm" . write))
  (evil-ex-define-cmd "wm" 'save-buffer)

  ;; 見にくいので縦にウィンドウを分割するのを抑止
  (setq split-width-threshold nil)
  ;; General keybind
  (evil-global-set-key 'hybrid (kbd "C-h") 'delete-backward-char)
  (evil-global-set-key 'hybrid (kbd "<C-tab>") 'yas-expand)
  (evil-leader/set-key "xp" 'mmm-parse-buffer)
  (define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char)
  (-each '(normal insert motion visual hybrid)
    (lambda (state)
      (evil-global-set-key state (kbd "C-;") 'helm-for-files)
      ))
  (spacemacs/set-leader-keys "s e" 'iedit-mode-toggle-on-function)
  (spacemacs/set-leader-keys "s E" 'evil-iedit-state/iedit-mode)
  (evil-global-set-key 'hybrid (kbd "M-y") 'helm-show-kill-ring)
  ;; C-z で最小化されるのを防ぐ(Mac用Emacsの設定)
  (global-unset-key (kbd "C-z"))
  (evil-global-set-key 'normal (kbd "C-z") 'evil-emacs-state)
  ;; : のミニバッファで c-b c-a を有効にする
  (define-key evil-ex-completion-map (kbd "C-b") 'backward-char)
  (define-key evil-ex-completion-map (kbd "C-a") 'beginning-of-line)
  ;; M-t C-t で文字が入れ替わるのは全く必要ないので無効化
  (global-set-key (kbd "C-t") nil)
  (global-set-key (kbd "M-t") nil)

  ;; jsx
  (add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.es6$" . rjsx-mode))
  (setq js2-strict-missing-semi-warning nil)

  ;; skk
  ;; (skk-preload)
  ;; ;;  dict
  ;; (setq skk-large-jisyo "~/.skk/SKK-JISYO.L")
  ;; (setq skk-extra-jisyo-file-list '("~/.skk/SKK-JISYO.geo"
  ;;                                   "~/.skk/SKK-JISYO.jinmei"
  ;;                                   "~/.skk/SKK-JISYO.propernoun"
  ;;                                   "~/.skk/SKK-JISYO.station"))
  ;; (defun my-skk-c-j ()
  ;;   (interactive)
  ;;   (if skk-henkan-mode
  ;;       (skk-kakutei)
  ;;     (skk-mode 1)))
  ;; ;; C-j でひらがなモードに戻る。ただし変換中は確定にする
  ;; (evil-global-set-key 'hybrid (kbd "C-j") 'my-skk-c-j)
  ;; ;; delete キーで文字が削除できなかったので再マップ
  ;; (evil-define-key 'hybrid skk-j-mode-map (kbd "<backspace>") 'backward-delete-char)

  ;; yas
  (evil-global-set-key 'hybrid (kbd "M-i") 'yas-expand)
  ;; yasnippet
  (setq yas-new-snippet-default "\
# -*- mode: snippet -*-
# name: $1
# ^ 一行説明
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# ^ expand が反応する文字列
# binding: ${3:C-c m}
# expand-env: ${4:((yas/indent-line 'fixed) (yas/wrap-around-region 'nil))}
# ^ ワンタイムでセットされる変数
# group: ${5:group-name}
# ^ メニュ- 等で使用される文字列
# condition: ${6:t}
# ^ non-nil の場合にときに実行される
# --
$0")
  ;; ;; skk key
  ;; (setq skk-sticky-key ";")
  ;; (define-key minibuffer-local-map (kbd "C-x C-j") '(lambda () (interactive) (skk-mode t)))
  ;; (define-key evil-ex-completion-map (kbd "C-x C-j") '(lambda () (interactive) (skk-mode t)))
  ;; (define-key evil-ex-completion-map (kbd "C-x C-j") '(lambda () (interactive) (skk-mode t)))
  ;; (evil-global-set-key 'hybrid (kbd "C-j") 'my-skk-c-j)
  ;; (evil-global-set-key 'hybrid (kbd "C-x C-j") '(lambda () (interactive) (skk-mode t)))
  ;; (add-hook 'evil-normal-state-entry-hook '(lambda () (interactive) (skk-mode -1)))

  ;; company-mode
  (with-eval-after-load "markdown-mode"
     (setq company-global-modes '(not markdown-mode))
     (add-hook 'markdown-mode-hook 'spacemacs/toggle-auto-completion-off))
  (setq auto-completion-enable-help-tooltip t)
  (setq auto-completion-enable-snippets-in-popup t)

  (with-eval-after-load "company"
    (define-key company-active-map (kbd "C-h") 'delete-backward-char)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
    )

  ;; edbi
  (setenv "PERL5LIB" "/Users/ichiro/perl5/lib/perl5")
  (setq edbi:ds-history-file "~/.emacs.d/.cache/.edbi-ds-hitory")
  (setq edbi:query-result-fix-header nil)

  ;; mc/mark
  (setq mc/list-file "~/.emacs.d/.cache/.mc-lists.el")

  ;; rake.el
  (setq rake-cache-file "~/.emacs.d/.cache/rake.cache")

  ;; geeknote
  ;; (evil-global-set-key 'normal (kbd "SPC a e t") 'geeknote-tag-list)
  ;; (evil-global-set-key 'normal (kbd "SPC a e T") 'geeknote-find-tags)
  ;; (evil-global-set-key 'normal (kbd "SPC a e n") 'geeknote-notebook-list)
  ;; (evil-global-set-key 'normal (kbd "SPC a e N") 'geeknote-find-in-notebook)
  (spacemacs/set-leader-keys "a e t" 'geeknote-tag-list)
  (spacemacs/set-leader-keys "a e T" 'geeknote-find-tags)
  (spacemacs/set-leader-keys "a e n" 'geeknote-notebook-list)
  (spacemacs/set-leader-keys "a e N" 'geeknote-find-in-notebook)

  ;; monkey patch フォークしたバージョンだと tags が tag になっている関係で
  ;; タグがサポート出来ない。タグの部分は削除する。
  (defun geeknote-create (title)
    "Create a new note with the given title.

TITLE the title of the new note to be created."
    (interactive "sName: ")
    (message (format "geeknote creating note: %s" title))
    (let ((note-title (geeknote--parse-title title))
          (note-notebook (geeknote--parse-notebook title)))
      (async-shell-command
       (format (concat geeknote-command " create --content WRITE --title %s"
                       (when note-notebook " --notebook %s"))
               (shell-quote-argument note-title)
               (shell-quote-argument (or note-notebook ""))))))


  ;; ;; org-mode
  (require 'ox-pandoc)
  (require 'ox-md)
  (define-key org-mode-map (kbd "M-l") 'org-indent)
  (define-key org-mode-map (kbd "M-h") 'org-outdent)

  ;; 翻訳
  (spacemacs/set-google-translate-languages "en" "ja")

  ;; helm
  ;;  key
  (spacemacs/set-leader-keys "h o" 'helm-occur)
    ;; helm
  (eval-after-load "helm"
    '(progn
     ;; helm-map
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
       (spacemacs/set-leader-keys "s o" 'helm-occur)
       (define-key helm-map (kbd "C-M-n") 'helm-next-source)
       (define-key helm-map (kbd "C-M-p") 'helm-previous-source)
       (define-key helm-map (kbd "C-h") 'delete-backward-char)
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
     ))
  (eval-after-load "helm-files"
    '(progn
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
       (define-key helm-find-files-map (kbd "C-h") 'helm-ff-delete-char-backward)
       (define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)))
  (eval-after-load "helm-org"
    '(progn

       ))

  ;; markdown
  (setq markdown-command "pandoc")
  (setq markdown-list-indent-width 2)
  (setq markdown-xhtml-header-content
        "<link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\"
               rel=\"stylesheet\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\"
               crossorigin=\"anonymous\">
         <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"
                 integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\"
                 crossorigin=\"anonymous\"></script>
         <style type=\"text/css\"> body{ padding: 2em} </style>"
        )
  (spacemacs/set-leader-keys-for-minor-mode 'markdown-mode (kbd "n") 'mmm-narrow-to-submode-region)
  ;; markdown で バッククォートブロックを入力しやすくする
  ;; (sp-local-pair 'markdown-mode "```" "```")

  ;; projectile
  (projectile-rails-global-mode)
  (evil-define-key 'normal projectile-rails-mode-map (kbd "C-<return>") 'projectile-rails-goto-file-at-point)

  ;;; mmm
  (with-eval-after-load "mmm-mode"
    (-each '("sh"
             "haml"
             "coffee"
             "html"
             "css"
             "html-erb"
             "plantuml"
             "dos"
             "css"
             "js2"
             "web"
             "emacs-lisp") ;; 引数にメジャーモードの関数 -mode を抜いた文字列のリストを渡す
      '(lambda (mode-name)
         (let ((md-class (intern (concat "markdown-" mode-name))))
           (mmm-add-classes
            (list (list md-class
                        :submode (intern (concat mode-name "-mode"))
                        :face 'mmm-declaration-submode-face
                        :front (concat "^```" mode-name "[\n]+")
                        :back "^```$")))
           (mmm-add-mode-ext-class 'markdown-mode nil md-class)))))

  ;;; plantuml
  ;; 改行の後に不要なインデントがされるのを防ぐ
  (with-eval-after-load "plantuml-mode"
    (define-key plantuml-mode-map (kbd "<return>") '(lambda () (interactive) (insert "\n")))
    (setq plantuml-output-type "png")
  )
  ;; plantuml-preview をした後に C-g するとデフォルトでは image をテキストで開く
  ;; しかし svg で画像が生成されていると一行が長すぎて Emacs がフリーズするので q と同じ quit-window  にする
  (define-key image-mode-map (kbd "C-g") 'quit-window)

  ;;; rails
  (projectile-rails-global-mode)
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
    "rRx" 'projectile-rails-extract-region
    )

  ;;mc/mark
  (evil-global-set-key 'visual (kbd "C-*") 'mc/mark-all-like-this-dwim)
  (evil-global-set-key 'visual (kbd "M-*") 'mc/mark-all-symbols-like-this-in-defun)
  (evil-global-set-key 'visual (kbd "C-<") 'mc/mark-previous-like-this)
  (evil-global-set-key 'visual (kbd "C->") 'mc/mark-next-like-this)
  (evil-global-set-key 'visual (kbd "C-M-<") 'mc/skip-to-previous-like-this)
  (evil-global-set-key 'visual (kbd "C-M->") 'mc/skip-to-next-like-this)
  (evil-global-set-key 'visual (kbd "C-S-SPC") 'mc/skip-to-next-like-this)


  ;; howm
  (require 'howm)
  ;; keybind "w" is Wiki
  ;; http://blechmusik.hatenablog.jp/entry/2013/07/09/015124
  (setq howm-process-coding-system 'utf-8-unix)
  (setq howm-view-use-grep t)
  (setq howm-view-grep-file-stdin-option nil)
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

  ;; 現在のカーソル位置にURLのテキストをマークダウン形式にして挿入する
  ;; howm での利用を想定 pandocが必須
  (defun my-insert-markdown-from-url (url)
    (interactive "sURL: ")
    (let ((markdown-text))
      (with-temp-buffer
        (shell-command (concat "pandoc -f html -t markdown " url)
                       (current-buffer))
        (setq markdown-text (buffer-string)))
      (insert markdown-text)))

  (with-eval-after-load "dash"
    (setq dash-at-point-mode-alist
          (delete (assoc 'ruby-mode dash-at-point-mode-alist) dash-at-point-mode-alist))
    (add-to-list 'dash-at-point-mode-alist
                 '(ruby-mode . "rubygems,rails,ruby,haml"))
    (setq dash-at-point-mode-alist
          (delete (assoc 'haml-mode dash-at-point-mode-alist) dash-at-point-mode-alist))
    (add-to-list 'dash-at-point-mode-alist
                 '(haml-mode . "rubygems,rails,ruby,bootstrap,haml"))
    (add-to-list 'dash-at-point-mode-alist
                 '(coffee-mode . "jquery,javascript,bootstrap"))
    )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-global-modes (quote (not markdown-mode)))
 '(evil-want-Y-yank-to-eol nil)
 '(indent-guide-delay 0.1 t)
 '(mac-pass-command-to-system nil)
 '(mac-pass-control-to-system t)
 '(markdown-command "markdown2")
 '(org-agenda-files (quote ("~/Documents/org/tasks.org")))
 '(package-selected-packages
   (quote
    (rjsx-mode helm-rails edbi-sqlite string-inflection winum solarized-theme request diminish packed avy evil async f dash s imenu-list swift-mode smart-newline helm-robe ag zonokai-theme zenburn-theme zen-and-art-theme underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme seti-theme reverse-theme railscasts-theme purple-haze-theme professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme organic-green-theme omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme naquadah-theme mustang-theme monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme majapahit-theme lush-theme light-soap-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme heroku-theme hemisu-theme hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gandalf-theme flatui-theme flatland-theme firebelly-theme farmhouse-theme espresso-theme dracula-theme django-theme darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes afternoon-theme wgrep rainbow-mode lispxmp company-quickhelp flycheck-plantuml plantuml-mode ox-pandoc ht ox-gfm iedit projectile quickrun org alert log4e gntp json-snatcher json-reformat multiple-cursors haml-mode ham-mode markdown-mode html-to-markdown gitignore-mode fringe-helper git-gutter+ git-gutter pos-tip flycheck epc ctable concurrent deferred web-completion-data dash-functional tern company auto-complete highlight-indent-guides csv-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic which-key web-mode rspec-mode pug-mode projectile-rails inflections org-projectile info+ indent-guide hungry-delete htmlize helm-dash helm-ag google-translate git-link evil-matchit evil-magit dumb-jump ddskk aggressive-indent ace-link smartparens bind-map highlight helm helm-core yasnippet skewer-mode js2-mode magit magit-popup git-commit with-editor hydra inf-ruby spacemacs-theme yari yaml-mode ws-butler window-numbering web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package toc-org tagedit spaceline smeargle slim-mode simple-httpd scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop robe restart-emacs rbenv rake rainbow-delimiters quelpa popwin persp-mode pcache paradox ox-qmd orgit org-present org-pomodoro org-plus-contrib org-download org-bullets open-junk-file neotree move-text mmm-mode minitest markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint less-css-mode json-mode js2-refactor js-doc ido-vertical-mode howm hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet golden-ratio gnuplot gmail-message-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md geeknote flycheck-pos-tip flx-ido fill-column-indicator feature-mode fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu enh-ruby-mode emmet-mode elisp-slime-nav edit-server edbi diff-hl define-word dash-at-point company-web company-tern company-statistics column-enforce-mode coffee-mode clean-aindent-mode chruby cdb ccc bundler auto-yasnippet auto-highlight-symbol auto-compile adaptive-wrap ace-window ace-jump-helm-line ac-ispell)))
 '(paradox-github-token t)
 '(plantuml-jar-path "/usr/local/Cellar/plantuml/8048/libexec/plantuml.jar")
 '(plantuml-java-args (quote ("-Djava.awt.headless=true" "-jar" "-tpng")))
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
