(require 'package)
(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))

      package-archive-priorities
      '(("MELPA"        . 10)
        ("GNU ELPA"     . 5)))

(package-initialize)
(setq package-enable-at-startup nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#263238"))
 '(custom-safe-themes
   (quote
    ("7b5a0924a76e3bcdf25b16b489ca27c5ae473f728c0ba76a47c7c21807d08251" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(elfeed-feeds
   (quote
    ("http://feeds.feedburner.com/carbonbrief" "https://byuu.net/feed")))
 '(exec-path-from-shell-shell-name "/bin/zsh")
 '(fci-rule-color "#E8EBC8")
 '(global-ethan-wspace-mode t)
 '(helm-ag-command-option "--path-to-ignore ~/.ignore")
 '(hl-sexp-background-color "#1c1f26")
 '(package-selected-packages
   (quote
    (company-lua love-minor-mode lua-mode log4j-mode go-mode acme-theme request elpy esup nov annotate racket-mode forge elfeed htmlize keyfreq git-link lsp-mode company-lsp sx sqlup-mode diff-hl robe helm-bundle-show bundler mocha recompile-on-save chess org-journal eyebrowse helm-flycheck flycheck rjsx-mode projectile-rails 0xc indium smartparens edit-server rubocop sql-indent md4rd magit-gh-pulls evil-mc string-inflection projectile-ripgrep helm-rg smart-mode-line pandoc-mode jabber speed-type coffee-mode php-mode yatemplate borland-blue-theme evil-magit ac-js2 chruby which-key ethan-wspace babel-repl linum-relative dash-at-point sass-mode helm-dictionary tern realgud-pry realgud-byebug realgud yaml-mode helm-ag markdown-mode rainbow-mode rainbow-delimiters evil-surround web-mode magit exec-path-from-shell auto-compile use-package material-theme evil)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))

(org-babel-load-file "~/.emacs.d/config.org")

(use-package edit-server
  :ensure t
  :config
  (edit-server-start))

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t))

(use-package company
  :ensure t
  :config
  (require 'company)
  (add-hook 'after-init-hook 'global-company-mode))

(use-package yafolding
  :ensure t
  :config
  (require 'yafolding)
  (add-hook 'prog-mode-hook
            (lambda () (yafolding-mode))))

;; change yes or no prompt to accept y or n
(fset 'yes-or-no-p 'y-or-n-p)

(global-linum-mode t)

(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(helm-mode 1)

(projectile-mode t)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(helm-projectile-on)

(require 'yasnippet)
(yas-global-mode 1)

(require 'rspec-mode)

;; Visually marks the 80th column
(require 'fill-column-indicator)

(eval-after-load 'rspec-mode
  '(rspec-install-snippets))

;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; setup js2-mode for javascript files
;; (autoload 'js2-mode "js2" nil t)
;; (add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-hook 'js2-mode-hook 'ac-js2-mode)

;; Always turn on rainbow-mode when editing certain files
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'js-mode-hook 'rainbow-mode)
(add-hook 'emacs-lisp-mode-hook 'rainbow-mode)

(add-to-list 'auto-mode-alist '("\\.js.erb\\'" . javascript-mode))
(add-to-list 'auto-mode-alist '("\\.json$\\''" . javascript-mode))

;; Load SASS mode for scss files
(add-to-list 'auto-mode-alist '("\\.scss\\'" . sass-mode))

;; Change location of where Emacs saves backup files
(setq backup-directory-alist `(("." . "~/.saves")))

;; Go away tabs
(setq-default indent-tabs-mode nil)

;; Turn on column mode so we can see line number and column number
(column-number-mode)

;; Enable rainbow-delimiters
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Set indent level to 2 for js-mode
(setq js-indent-level 2)

(require 'uniquify)

(global-auto-revert-mode t)

(global-hl-line-mode 1)

;; ;; customize background color of line highlight
;; (set-face-background 'hl-line "#3C3D38")

;; Don't obliterate clipbaord contents when killing text
(setq save-interprogram-paste-before-kill t)

;; Always kill current buffer
(global-set-key (kbd "C-x k") 'kill-this-buffer)

(show-paren-mode t)

(scroll-bar-mode -1)

(add-to-list 'auto-mode-alist
             '("\\.log\\'" . (lambda ()
                               (ansi-color-for-comint-mode-on)
                               (add-to-list 'comint-output-filter-functions 'ansi-color-process-output))))
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;; Allow dired to guess the directory to move/copy files to.'
;; If two dired buffers are open, dired will default to the file url
;; opened in the other buffer.
(setq dired-dwim-target t)

(global-set-key (kbd "C-c o")
                (lambda () (interactive) (find-file "~/organizer.org")))
(global-set-key (kbd "C-c c") 'org-capture)
(setq org-default-notes-file "~/organizer.org")

(global-set-key (kbd "C-c i")
                (lambda () (interactive) (find-file user-init-file)))
(global-set-key (kbd "C-c b")
                (lambda () (interactive) (find-file "~/Dropbox/bookmarks.org")))

;; (add-hook 'js-mode-hook (lambda () (tern-mode t)))
;; (add-hook 'js-mode-hook
;;           (lambda ()
;;             (define-key evil-normal-state-local-map (kbd "M-.") 'tern-find-definition)
;;             (define-key evil-normal-state-local-map (kbd "M-,") 'tern-pop-find-definition)))


(require 'key-chord)
(key-chord-mode 1)

(setq tide-tsserver-process-environment '("TSS_LOG=-level verbose -file /tmp/tss.log"))

;; Auto-close tags in XML documents
(setq nxml-slash-auto-complete-flag t)

(prettify-symbols-mode t)
(desktop-save-mode t)
(put 'dired-find-alternate-file 'disabled nil)

(defun zajn/node-repl ()
  (interactive)
  (pop-to-buffer (make-comint "node-repl" "node" nil "--interactive")))

(global-set-key (kbd "RET") 'zajn/newline-and-indent)
(linum-relative-global-mode t)
(chruby-use-corresponding)

;;; init.el ends here
(put 'narrow-to-region 'disabled nil)

;; The mystery deepens
(setq fancy-splash-image "~/220Mystery.jpg")

;; Don't insert magic encoding comments on save in ruby files
(setq ruby-insert-encoding-magic-comment nil)

;; display a nicer mode-line
(smart-mode-line-enable)

(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)

;; https://emacs.stackexchange.com/a/21207
(defun zajn/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'zajn/use-eslint-from-node-modules)

(defun zajn/use-sass-lint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (sass-lint (and root
                         (expand-file-name "node_modules/sass-lint/bin/sass-lint.js"
                                           root))))
    (when (and sass-lint (file-executable-p sass-lint))
      (setq-local flycheck-sass/scss-sass-lint-executable sass-lint))))

(add-hook 'flycheck-mode-hook #'zajn/use-sass-lint-from-node-modules)

(eval-after-load 'evil-core
  '(evil-set-initial-state 'profiler-report-mode 'emacs))

(add-hook 'sql-interactive-mode-hook
          (lambda ()
            (toggle-truncate-lines t)))
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

(add-hook 'org-mode-hook 'zajn/org-mode-hook)
(defun zajn/org-mode-hook ()
  (auto-fill-mode 1)
  (set-fill-column 120))

(global-set-key (kbd "M-l") 'helm-buffers-list)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:height 140 :family "Office Code Pro D")))))
