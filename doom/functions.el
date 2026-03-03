;;; functions.el -*- lexical-binding: t; -*-
;;; Personal Functions for Work
(defun personal/journal-search ()
  "Search Journal Files Via Consult"
  (interactive)
  (consult-ripgrep "~/org/journal/"))

(defun personal/journal-frame ()
  "Open Curren Journal Entry In Dedicated Frame"
  (interactive)
  (let ((frame (make-frame '((name . "ORG JOURNAL")
                             (width . 100)
                             (height . 40)))))
    (select-frame-set-input-focus frame)
    (org-journal-new-entry nil)
    (delete-other-windows)
    (local-set-key (kbd "C-c C-c")
                   (lambda ()
                     (interactive)
                     (save-buffer)
                     (delete-frame)))))

(defun personal/journal-month-search ()
  "Search Journal Files After Filtering Month"
  (interactive)
  (let ((year (format-time-string "%Y"))
        (month (completing-read "Month: "
                                '("Jan", "Feb", "Mar", "Apr"
                                  "May", "Jun", "Jul", "Aug",
                                  "Sep", "Oct", "Nov", "Dec")
                                nil t (format-time-string "%B"))))
    (consult-ripgrep (expand-file-name month (expand-file-name "~/org/journal/")))))

(defun personal/create-requirements ()
  "Create New Requirements Project Using Snippets"
  (interactive)
  (let* ((project-name (read-string "Requirements Title: "))
         (project-dir (expand-file-name project-name "~/Requirements")))
    (make-directory project-dir t)
    (+workspace-new project-name)
    (+workspace-switch project-name)
    (with-temp-file (expand-file-name ".projectile" project-dir)
      (insert ""))

    (do-list (file-info '(("todo.org" "Project Tasks")
                          ("notes.org" "Project Notes")
                          ("requirements.org" "Requirements Template")))
             (let ((filepath (expand-file-name (car file-info) project-dir))
                   (snippet-name (cadr file-info)))
               (find-file filepath)
               (yas-expand-snipet (yas-lookup-snippet snippet-name 'org-mode))
               (save-buffer)
               (kill-buffer)))
    (find-file (expand-file-name "requirements.org" project-dir))
    (find-file-noselect (expand-file-name "todo.org" project-dir))
    (message "Requirements Folder Created at %s" project-dir)))

