;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!
(setq doom-font (font-spec :family "Maple Mono" :size 14 :weight 'semibold)
      doom-variable-pitch-font (font-spec :family "CaskaydiaCove Nerd Font Mono" :size 12 :weight 'semibold))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'compline)
(setq fancy-splash-image (expand-file-name "doom.png" doom-user-dir))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Load Personal Functions
(load! "functions")

(setq shell-file-name (executable-find "bash"))
(setq-default vterm-shell "/bin/fish")
(setq-default explicit-shell-file-name "/bin/fish")

(add-to-list 'default-frame-alist '(undecorated . t))
(remove-hook 'doom-first-buffer-hook #'global-hl-line-mode)

(add-hook! 'after-save-hook
           #'executable-make-buffer-file-executable-if-script-p)

;; Maintain terminal transparency in Doom Emacs
(after! doom-themes
  (unless (display-graphic-p)
    (set-face-background 'default "undefined")))

;; Setup a Consult Buffer For New Windows
(defadvice! prompt-for-buffer (&rest _)
  :after '(evil-window-split evil-window-vsplit evil-window-new)
  (consult-buffer))

;; EVIL Configuration
(after! evil
  (setq evil-split-window-below t
        evil-vsplit-window-right t
        evil-ex-substitute-global t
        evil-respect-visual-line-mode t
        +evil-want-o/O-to-continue-comments nil))

(map! :leader
      :desc "Setup Requirements Project" "pn" #'personal/create-requirements
      :desc "Search Through Journal Entries" "njs" #'personal/journal-search
      :desc "Calfw" "oc" #'=calendar)

;; ORG Configuration
(after! org
  (setq org-todo-keywords
        '((sequence "TODO(t)" "PROJ(p)" "HOLD(h)" "QUESTION(q)" "IDEA(i)" "MEETING(m)" "NOTE(n)"
           "|" "DONE(d)" "REMOVE(r)")
          (sequence "[ ](R)" "[-](S)" "[?](W)" "|" "[X](D)")))
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "" :weight bold))
          ("PROJ" . (:foreground "#bba5d1" :weight bold))
          ("HOLD" . (:foreground "#f2e1af" :weight bold))
          ("QUESTION" . (:foreground "#9ccfde" :weight bold))
          ("IDEA" . (:foreground "#9ccfde" :weight bold))
          ("MEETING" . (:foreground "#f1cba7" :weight bold))
          ("NOTE" . (:foreground "#f1cba7" :weight bold))
          ("DONE" . (:foreground "#52555a" :weight bold))
          ("REMOVE" . (:foreground "#52555a" :weight bold))
          ("[ ]" . (:foreground "#9fbbd8" :weight bold))
          ("[-]" . (:foreground "#a4d7a4" :weight bold))
          ("[?]" . (:foreground "#f2e1af" :weight bold))
          ("[X]" . (:foreground "#52555a" :weight bold))))
  (setq org-modern-tag-faces
        (quote ((t (:background "#52555a" :weight bold)))))
  (setq org-modern-list
        '((?- . "»")
          (?+ . "›")
          (?* . "→")))
  (setq org-modern-table nil
        org-mordern-tag t)

  (setq +org-capture-work-file "~/org/work.org"
        +org-capture-notes-file "~/org/notes.org"
        org-archive-location "~/org/archive/%s_archive::")
  (setq org-capture-templates
        '(("t" "Quick Todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n" :prepend t)
          ("n" "Quick Note" entry
           (file+headline +org-capture-todo-file "Notes")
           "* NOTE %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n" :prepend t)
          ("s" "Setup Notes" entry
           (file+headline +org-capture-notes-file "Setup Notes")
           "* NOTE %?\n Captured from: %F\n Test Option: %A" :preprend t)
          ("w" "Work Documentation")
          ("wr" "Requirements Documentation" entry
           (file+headline +org-capture-work-file "Development Requirements")
           "* PROJ %?\n:PROPERTIES:\n:CREATED: %U\n:DEVOPS: [[][]]\n:END:\n" :prepend t)
          ("wt" "Development Research (Todo)" entry
           (file+headline +org-capture-work-file "Development Research")
           "* TODO %?\n:PROPERTIES:\n:CREATED: %U\n:DEVOPS: [[][]]\n:END:\n" :prepend t)
          ("wd" "Project Decision" entry
           (file+headline +org-capture-work-file "Milestone Decisions")
           "* QUESTION %?\n:PROPERTIES:\n:CREATED: %U\n:DEVOPS: [[][]]\n:END\n - \n" :prepend t)
          ("wn" "General Notes" entry
           (file+headline +org-capture-work-file "General Notes")
           "* NOTE %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n" :prepend t)
          ("p" "Templates for Projects")
          ("pt" "Project(local) Tasks" entry
           (file+headline +org-capture-project-todo-file "Project Tasks")
           "* TODO %?\n:PROPERTIES:\n:CREATED %U\n:END:\n %i" :prepend t)
          ("pn" "Project(local) Notes"
           (file+headline +org-capture-project-notes-file "Project Notes")
           "* NOTE %?\n:PROPERTIES:\n:CREATED: %U\n:END:\n -\n %i" :prepend t)
          ("pd" "Project(local) Decisions"
           (file+headline +org-capture-project-notes-file "Project Decisions")
           "* QUESTION %?\n:PROPERTIES:\n:CREATED: %U\n %i" :prepend t)))

  (setq org-journal-file-type 'monthly
        org-journal-date-format "%A, %Y-%m-%d"
        org-journal-file-format "%Y/%B/w%V.org"
        org-journal-start-on-weekday 7)
  (setq org-journal-file-header
        (lambda (time)
          (let* ((dow (string-to-number (format-time-string "%u" time)))
                 (sunday (time-subtract time (days-to-time (% dow 7))))
                 (saturday (time-add sunday (days-to-time 6))))
            (format "#+TITLE: Weekly Journal\n#+DATE: %s - %s\n#+STARTUP: showall\n\n"
                    (format-time-string "%B %d" sunday)
                    (format-time-string "%B %d, %Y" saturday))))))

(custom-set-faces!
  '(org-agenda-dimmed-todo-face :foreground "#f0efeb" :weight normal))

(use-package! org-super-agenda
  :after org-agenda
  :config
  (org-super-agenda-mode)
  (setq org-super-agenda-groups
        '((:name "Personal Tasks" :file-path "todo")
          (:name "Work Projects" :and (:file-path "work" :todo "PROJ"))
          (:name "Work Tasks" :and (:file-path "work" :todo "TODO"))
          (:name "Everything Else" :file-path "notes"))))

(after! org-agenda
  (set-popup-rule! "^\\*Org Agenda"
    :size 'bottom
    :size 0.6
    :select t)
  (setq org-agenda-tags-column 80
        org-agenda-dim-blocked-tasks nil)
  (setq org-agenda-prefix-format
        '((agenda . " %i %-12:c%?-12t% s")
          (todo . " %i %l %s")
          (tags . " %i %-12:c")
          (search . " %i %-12:c")))
  (setq org-agenda-custom-commands
        '(("w" "Work Orverview"
           ((alltodo ""))
           ((org-agenda-files '("~/org/work.org"))
            (org-agenda-overriding-header "Work Focus")
            (org-super-agenda-groups
             '((:auto-parent t)))))

          ("l" "Weekly Log (Last 7 Days)"
           ((agenda ""))
           ((org-agenda-files '("~/org/work.org"))
            (org-agenda-overriding-header "Weekly Performance Review")
            (org-agenda-span 7)
            (org-agenda-start-day nil)
            (org-agenda-start-on-weekday 0) ;; Look back 6 days + today
            (org-agenda-start-with-log-mode t)
            (org-agenda-log-mode-items '(clock closed))
            (org-super-agenda-groups
             '((:name "Time Log" :log t)
               (:discard (:anything t)))))))))

(after! gptel
  ;; 1. Define the backend and point it to the machine name in your .authinfo
  (setq gptel-model 'gemini-2.5-flash)
  (setq gptel-backend
        (gptel-make-gemini "Gemini"
          :key #'gptel-api-key
          :stream t)))

(add-hook 'gptel-post-response-functions #'gptel-end-of-response)
(add-hook 'gptel-post-stream-hook 'gptel-auto-scroll)
