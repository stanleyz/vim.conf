(require-package 'evil)
(evil-mode t)

(require-package 'evil-jumper) ; c-i / c-o
(require-package 'evil-leader) ; c-i / c-o
(require-package 'evil-indent-textobject)
(require-package 'evil-surround)
(require-package 'evil-matchit) ; matchit (show matching parenthesis)
(require-package 'evil-search-highlight-persist)
(require-package 'ace-jump-mode) ; need this for jump to work
(require-package 'multiple-cursors)
(require-package 'autopair)

(global-evil-matchit-mode t)
(global-evil-surround-mode 1)
(global-evil-search-highlight-persist t)
(global-evil-leader-mode t)
(autopair-global-mode)
(setq ace-jump-word-mode-use-query-char nil)
(setq evil-leader/in-all-states t) ; leader

;; leader
(evil-leader/set-leader ",")
(evil-leader/set-key 
  "b" 'helm-buffers-list
  "f" 'ido-find-file
  "F" 'helm-find
  "h" 'windmove-left
  "j" 'windmove-down
  "k" 'windmove-up
  "l" 'windmove-right
  "n" 'mc/mark-next-like-this
  "N" 'mc/skip-to-next-like-this
  "p" 'mc/mark-previous-like-this
  "P" 'mc/skip-to-previous-like-this
  "q" 'evil-quit
  "w" 'evil-ace-jump-word-mode
  "x" 'helm-M-x)

(evil-leader/set-key "o" (lambda () ; <leader>o open line below
                           (interactive)
                           (evil-open-below 1)
                           (evil-edit-state)))
(evil-leader/set-key "O" (lambda () ; <leader>o open line below
                           (interactive)
                           (evil-open-above 1)
                           (evil-edit-state)))

(provide 'init-evil)
