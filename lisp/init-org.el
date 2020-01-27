(defun org-archive-subtree-and-set-startup-visibility ()
  (interactive)
  (org-archive-subtree)
  (org-set-startup-visibility))

(use-package org
  :ensure nil ;; package is bundled with emacs
  :bind (("C-c c" . org-capture)
         ("C-c a" . org-agenda)
         ("C-c y" . org-archive-subtree-and-set-startup-visibility)
         ("C-c l" . org-store-link))
  :config
  ;; name of subtree where archived tasks should be moved
  (setq org-archive-location "::* Archived Tasks")

  ;; display all org files in agenda
  (setq org-agenda-files (list org-directory))

  ;; refile targets 1 level in current buffer and all org agenda files
  (setq org-refile-targets '((nil :maxlevel . 1) (org-agenda-files :maxlevel . 1)))

  ;; record time when moving a task to done state
  (setq org-log-done 'time)

  ;; default file for capture
  (setq org-default-notes-file (expand-file-name "personal.org" org-directory))

  ;; capture template including title, date and time
  (setq org-capture-templates '(("p" "Personal" entry (file+olp "" "Tasks")
                                 "* TODO %?\n  %U"
                                 :prepend t
                                 :empty-lines-after 1)
                                ("w" "Work" entry (file+olp "work.org" "Tasks")
                                 "* TODO %?\n  %U"
                                 :prepend t
                                 :empty-lines-after 1)))

  ;; automatically mark archived entry as done
  (setq org-archive-mark-done t)

  ;; highlight code blocks
  (setq org-src-fontify-natively t)

  ;; indent code blocks the same way as the language major mode
  (setq org-src-tab-acts-natively t)

  ;; define todo states
  (setq org-todo-keywords '((sequence "TODO" "WAIT" "DONE")))

  ;; disallow invisible edits
  (setq org-catch-invisible-edits 'error)

  ;; customize agenda
  (setq org-agenda-custom-commands
        '(;; default view
          ("n" "Agenda and all TODOs" ((agenda "") (alltodo "")))
          ;; split by state
          ("m" "Agenda and all TODOs split by state"
           ((agenda "") (todo "TODO") (todo "WAIT"))))))

(provide 'init-org)
