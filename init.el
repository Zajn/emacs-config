(require 'package)
(setq package-archives
      '(("gnu ELPA"     . "https://elpa.gnu.org/packages/")
        ("MELPA Stable" . "https://stable.melpa.org/packages/")
        ("MELPA"        . "https://melpa.org/packages/"))

      package-archive-priorities
      '(("MELPA Stable" . 10)
        ("gnu ELPA"     . 5)
        ("MELPA"        . 0)))

(setq package-enable-at-startup nil)
(package-initialize t)

;; Install use-package if it isn't already installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Load org-mode and load the rest of config with org-babel
(use-package org
  :ensure t
  :config
  (require 'org)
  (org-babel-load-file "~/.emacs.d/emacs.org"))

