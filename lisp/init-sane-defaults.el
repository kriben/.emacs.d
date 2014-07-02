;; use soft tabs
(setq-default indent-tabs-mode nil)

;; make prompts accept y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; no confirmation for non-existent files or buffers
(setq confirm-nonexistent-file-or-buffer nil)

;; disable audible bell
(setq ring-bell-function 'ignore)

;; scroll one line at a time
(setq mouse-wheel-scroll-amount
      '(1
        ((shift) . 5)
        ((control))))

;; disable scroll acceleration
(setq mouse-wheel-progressive-speed nil)

;; reload buffers automatically when files change on disk
(global-auto-revert-mode 1)

;; reload dired buffers automatically and be quit about it
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)

;; integrate with X clipboard
(setq x-select-enable-clipboard t)

;; ensure clipboard strings are saved into kill ring
(setq save-interprogram-paste-before-kill t)

;; move deleted files to trash
(setq delete-by-moving-to-trash t)

;; show keystrokes immediately
(setq echo-keystrokes 0.1)

;; add directory to buffer name if filename is not unique
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; automatically determine major-mode for newly created buffers
(setq-default major-mode
              (lambda ()
                ;; try buffer-file-name first  (will be nil for unsaved buffers)
                ;; and fall back to buffer-name
                (let ((buffer-file-name (or buffer-file-name (buffer-name))))
                  (set-auto-mode))))

;; show human readable sizes in dired
(setq dired-listing-switches "-alh")

;; single space ends a sentence
(setq-default sentence-end-double-space nil)

;; default to 80 chars fill-column
(setq-default fill-column 80)

;; undo/redo window configuration with C-c <left>/<right>
(winner-mode 1)

(provide 'init-sane-defaults)
