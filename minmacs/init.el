;;; init.el -*- lexical-binding: t; -*-

;; Restore GC after startup. 
(add-hook 'emacs-startup-hook
	  (lambda ()
	    (setq gc-cons-threshold (* 64 1024 1024)
		  gc-cons-percentage 0.1)
	    (message "Emacs loaded in %.2fs with %d garbage collections."
		     (float-time
		       (time-subtract after-init-time before-init-time))
		     gcs-done)))

;; Keep custom.el separate
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Basic Behavior
(setq inhibit-startup-screen t
      initial-scratch-message nil
      ring-bell-function 'ignore
      user-short-answers t
      make-backup-files nil
      auto-save-default nil
      createlockfiles nil)

(show-paren-mode 1)
(global-hl-line-mode 1)
(setq scroll-conservatively 101)
(column-number-mode 1)

;; Better Defaults 
(save-place-mode 1)
(savehist-mode 1)
(recentf-mode 1)
(global-auto-revert-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)
(repeat-mode 1)
(delete-selection-mode 1)
(electric-pair-mode 1)

(setq-default tab-width 4
	      tab-always-indent t
	      indent-tabs-mode nil)

(setq recentf-max-saved-items 200
      global-auto-revert-non-file-buffers t)

;; Simple Editing/UI
(column-number-mode)
(global-display-line-numbers-mode 1)

;; Disable line numbers in non-code modes
(dolist (hook '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook hook
            (lambda ()
              (display-line-numbers-mode -1))))

;;; Package Management
(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
	("nongnu" . "https://elpa.nongnu.org/nongnu/")
	("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless package-archives contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;;; Completion System
(use-package vertico
	     :init
	     (vertico-mode)
	     :custom
	     (vertico-cycle t))

;;; Completion - context added
(use-package marginalia
	     :init
	     (marginalia-mode))

(use-package orderless
	     :custom
	     (completion-styles '(orderless basic))
	     (completion-category-overrides
	       '((file (styles partial-completion)))))

(use-package consult
	     :bind
	     (("C-s" . consult-line)
	      ("C-c s" . consult-ripgrep)
	      ("C-x b" . consult-buffer)
	      ("M-y" . consult-yank-pop)
	      ("M-g g" . consult-goto-line)
	      ("M-g i" . consult-imenu)
	      ("M-g o" . consult-outline)))

;; Project Management
(use-package project
	     :ensure nil
	     :bind-keymap
	     ("C-c p" . project-prefix-map))

;; LSP Support
(use-package eglot
	     :ensure nil
	     :hook ((go-ts-mode odin-ts-mode)
		    . eglot-ensure)
	     :config
	     (add-to-list 'eglot-server-programs
			  '(odin-ts-mode . ("ols"))))

;; Tree-sitter
(setq treesit-language-source-alist
      '((go "https://github.com/tree-sitter/tree-sitter-go")
	(odin "https://github.com/tree-sitter-grammars/tree-sitter-odin")))

(defun rm/tab-indentation-mode ()
  "Use tabs for indentation"
  (setq-local indent-tabs-mode t
	      tab-width 4))

(use-package go-ts-mode
	     :ensure nil
	     :mode "\\.go\\'"
	     :hook (go-ts-mode . rm/tab-indentation-mode)
	     :config
	     (setq go-ts-mode-indent-offset 4))

(use-package odin-ts-mode
	     :vc (:url "https://github.com/Sampie159/odin-ts-mode")
	     :mode "\\.odin\\'")

;; Formatting
(use-package apheleia
	     :init
	     (apheleia-global-mode 1)
	     :config
	     (setf (alist-get 'go-ts-mode apheleia-mode-alist) 'gofmt)
	     (setf (alist-get 'odin-ts-mode apheleia-mode-alist) 'odinfmt))

;; Diagnostics
(use-package flymake
	     :ensure nil 
	     :hook (prog-mode . flymake-mode)
	     :bind
	     (("M-n" . flymake-goto-next-error)
	      ("M-p" . flymake-goto-prev-error)
	      ("C-c ! l" . flymake-show-buffer-diagnostics)
	      ("C-c ! p" . flymake-show-project-diagnostics)))


;; Git Configuration
(use-package magit
	     :bind
	     ("C-x g" . magit-status))

;; ORG Configuration
(use-package org
	     :ensure nil
	     :mode ("\\.org\\'" . org-mode)
	     :bind
	     (("C-c c" . org-capture)
	      ("C-c a" . org-agenda))
	     :custom
	     (org-directory "~/org")
	     (org-agenda-files '("~/org/inbox.org"
				 "~/org/tasks.org"
				 "~/org/notes.org"))
	     (org-startup-indented t)
	     (org-hide-emphasis-markers t)
	     (org-return-follows-link t)
	     (org-log-done 'time))

(setq org-capture-templates
      '(("t" "Task" entry
	 (file "~/org/inbox.org")
	 "* TODO %?\n %U\n")
	("n" "NOTE" entry
	 (file "~/org/notes.org")
	 "* %?\n %U\n")))

;; Which Key 
(use-package which-key
	     :init
	     (which-key-mode 1)
	     :custom
	     (which-key-ide-delay 0.5))

(use-package corfu
	     :init
	     (global-corfu-mode 1)
	     :custom
	     (corfu-auto t)
	     (corfu-auto-delay 0.2)
	     (corfu-auto-prefix 2))

;; Theming
(use-package kanagawa-themes
	     :ensure t
	     :defer t)

(use-package gruvbox-theme
	     :ensure t
	     :defer t)

(load-theme 'kanagawa-wave t)

;; Mode Line
(use-package mood-line
	     :ensure t
	     :init
	     (mood-line-mode 1)
	     :custom
	     (flymake-mode-line-lighter "")
	     (flymake-mode-line-format
	       '("" flymake-mode-line-exception flymake-mode-line-counters)))

(set-face-attribute 'mode-line nil
		    :height 110)

(set-face-attribute 'mode-line-inactive nil
		    :height 110)

;;; init.el ends here

