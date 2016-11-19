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
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     dash
     helm
     emacs-lisp
     git
     markdown
     org
     ruby-on-rails
     (ruby :variables ruby-enable-enh-ruby-mode t)
     javascript
     html
     react
     yaml
     evernote
     chrome
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
                                      howm
                                      edbi
                                      ddskk
                                      enh-ruby-mode
                                      coffee-mode
                                      js2-mode
                                      ox-reveal
                                      ox-gfm
                                      ox-qmd
                                      yari
                                      helm-dash
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
   dotspacemacs-check-for-update nil
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
   ;; Example for 5 recent files and 7 projects: '((recents . 5) (projects . 7))
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
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Ricty Diminished"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   ;; (default "C-M-m)
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
   dotspacemacs-fullscreen-at-startup t
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
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
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers 'text-mode
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; General
  (setq truncate-lines t)
  (setq mac-command-modifier 'meta)

  ;; Indent mode
  (indent-guide-global-mode t)
  (setq indent-guide-delay 1)
  (setq indent-guide-recursive t)

  ;; 見にくいので縦にウィンドウを分割するのを抑止
  (setq split-width-threshold nil)
  ;; General keybind
  (evil-global-set-key 'hybrid (kbd "C-h") 'delete-backward-char)
  (define-key company-active-map (kbd "C-h") 'delete-backward-char)
  (evil-global-set-key 'hybrid (kbd "<C-tab>") 'yas-expand)
  (define-key minibuffer-local-map (kbd "C-h") 'delete-backward-char)
  (-each '(normal insert motion visual hybrid)
    (lambda (state)
      (evil-global-set-key state (kbd "C-;") 'helm-for-files)
      ))
  (spacemacs/set-leader-keys "s e" 'iedit-mode-toggle-on-function)
  (spacemacs/set-leader-keys "s E" 'evil-iedit-state/iedit-mode)
  (evil-global-set-key 'hybrid (kbd "M-y") 'helm-show-kill-ring)

  ;; jsx
  (add-to-list 'auto-mode-alist '("\\.jsx$" . js2-jsx-mode))

  ;; skk
  (skk-preload)
  ;;  dict
  (setq skk-large-jisyo "~/.skk/SKK-JISYO.L")
  (setq skk-extra-jisyo-file-list '("~/.skk/SKK-JISYO.geo"
                                    "~/.skk/SKK-JISYO.jinmei"
                                    "~/.skk/SKK-JISYO.propernoun"
                                    "~/.skk/SKK-JISYO.station"))
  (defun my-skk-c-j ()
    (interactive)
    (if skk-henkan-mode
        (skk-kakutei)
      (skk-mode 1)))
  ;; C-j でひらがなモードに戻る。ただし変換中は確定にする
  (evil-global-set-key 'hybrid (kbd "C-j") 'my-skk-c-j)
  ;; delete キーで文字が削除できなかったので再マップ
  (evil-define-key 'hybrid skk-j-mode-map (kbd "<backspace>") 'backward-delete-char)

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

  ;;  key
  (setq skk-sticky-key ";")
  (define-key minibuffer-local-map (kbd "C-x C-j") '(lambda () (interactive) (skk-mode t)))
  (evil-global-set-key 'hybrid (kbd "C-j") '(lambda () (interactive)
                                                  (if skk-henkan-mode
                                                      (skk-kakutei)
                                                    (skk-mode t))))
  (evil-global-set-key 'hybrid (kbd "C-x C-j") '(lambda () (interactive) (skk-mode t)))
  ;; C-j でひらがなモードに戻る。ただし変換中は確定にする
  (evil-global-set-key 'hybrid (kbd "C-j") (lambda () (interactive)
                                             (if skk-henkan-mode
                                                 (skk-kakutei)
                                               (skk-mode 1))))
  (add-hook 'evil-normal-state-entry-hook '(lambda () (interactive) (skk-mode -1)))

  ;; company-mode keybind
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)

  ;; edbi
  (setenv "PERL5LIB" "/Users/ichiro/perl5/lib/perl5")
  (setq edbi:ds-history-file "~/.emacs.d/.cache/.edbi-ds-hitory")

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

  ;; org-mode
  (setq org-bullets-bullet-list '("■" "◆" "▲" "≫" "▶" "▷"))
  (spacemacs/set-leader-keys "o c" 'org-capture)
  (setq org-refile-targets '((nil  :maxlevel . 6)))
  (setq org-agenda-files '("~/Documents/org/tasks.org"))
  (spacemacs/set-leader-keys "f a" (defun my-org-find-task-file () (interactive) (find-file (-first-item org-agenda-files))))
  (setq org-global-properties '(("Effort_ALL" . "00:05 00:15 00:30 01:00")))
  (setq org-columns-default-format "%25ITEM %TODO %3PRIORITY %EFFORT(Effort){:} %CLOCKSUM %TAGS")

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
       (define-key helm-map (kbd "C-j") 'my-skk-c-j)
       ))

  ;; markdown
  (setq markdown-command "markdown2")
  (setq markdown-xhtml-header-content
        "<link href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\"
               rel=\"stylesheet\" integrity=\"sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u\"
               crossorigin=\"anonymous\">
         <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"
                 integrity=\"sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa\"
                 crossorigin=\"anonymous\"></script>
         <style type=\"text/css\"> body{ padding: 2em} </style>"
        )
  ;; markdown で バッククォートブロックを入力しやすくする
  (sp-local-pair 'markdown-mode "```" "\n```")

  ;; projectile
  (projectile-rails-global-mode)
  (evil-define-key 'normal projectile-rails-mode-map (kbd "C-<return>") 'projectile-rails-goto-file-at-point)

  ;; howm
  (require 'howm)
  ;; keybind "w" is Wiki
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
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dash-at-point-mode-alist
   (quote
    ((actionscript-mode . "actionscript")
     (arduino-mode . "arduino")
     (c++-mode . "cpp,net,boost,qt,cvcpp,cocos2dx,c,manpages")
     (c-mode . "c,glib,gl2,gl3,gl4,manpages")
     (caml-mode . "ocaml")
     (clojure-mode . "clojure")
     (coffee-mode . "coffee")
     (common-lisp-mode . "lisp")
     (cperl-mode . "perl")
     (css-mode . "css,bootstrap,foundation,less,awesome,cordova,phonegap")
     (dart-mode . "dartlang,polymerdart,angulardart")
     (elixir-mode . "elixir")
     (emacs-lisp-mode . "elisp")
     (enh-ruby-mode . "ruby,rails,rubygems")
     (erlang-mode . "erlang")
     (gfm-mode . "markdown")
     (go-mode . "go,godoc")
     (groovy-mode . "groovy")
     (haml-mode . "ruby,rubygems,rails,haml")
     (haskell-mode . "haskell")
     (html-mode . "html,svg,css,bootstrap,foundation,awesome,javascript,jquery,jqueryui,jquerym,angularjs,backbone,marionette,meteor,moo,prototype,ember,lodash,underscore,sencha,extjs,knockout,zepto,cordova,phonegap,yui")
     (jade-mode . "jade")
     (java-mode . "java,javafx,grails,groovy,playjava,spring,cvj,processing,javadoc")
     (js2-mode . "javascript,backbone,angularjs")
     (js3-mode . "nodejs")
     (latex-mode . "latex")
     (less-css-mode . "less")
     (lua-mode . "lua,corona")
     (markdown-mode . "markdown")
     (nginx-mode . "nginx")
     (objc-mode . "cpp,iphoneos,macosx,appledoc,cocoapods,cocos2dx,cocos2d,cocos3d,kobold2d,sparrow,c,manpages")
     (perl-mode . "perl,manpages")
     (php-mode . "php,wordpress,drupal,zend,laravel,yii,joomla,ee,codeigniter,cakephp,phpunit,symfony,typo3,twig,smarty,phpp,html,mysql,sqlite,mongodb,psql,redis")
     (processing-mode . "processing")
     (puppet-mode . "puppet")
     (python-mode . "python3,django,twisted,sphinx,flask,tornado,sqlalchemy,numpy,scipy,saltcvp")
     (ruby-mode . "ruby,rubygems,rails")
     (rust-mode . "rust")
     (sass-mode . "sass,compass,bourbon,neat,css")
     (scala-mode . "scala,akka,playscala,scaladoc")
     (stylus-mode . "stylus")
     (tcl-mode . "tcl")
     (tuareg-mode . "ocaml")
     (twig-mode . "twig")
     (vim-mode . "vim")
     (yaml-mode . "chef,ansible"))))
 '(indent-guide-delay 0.1)
 '(indent-guide-recursive t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))
