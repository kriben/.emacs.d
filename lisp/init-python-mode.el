(use-package python
  :ensure nil ;; package is bundled with emacs

  :config
  (add-hook 'python-mode-hook
          (lambda ()
            ;; disable electric indent
            (setq-local electric-indent-mode nil)
            ;; Disable guessing the indentation level
            (setq-local python-guess-indent nil)
            (setq-local python-indent 4)

            ;; highlight lines longer than 79 characters (pep8)
            (setq-local fill-column 79)
            ;; use flat index in imenu
            (setq-local imenu-create-index-function
                        'python-imenu-create-flat-index))))

(provide 'init-python-mode)
