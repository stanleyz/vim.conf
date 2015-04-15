;; helm settings (TAB in helm window for actions over selected items,
;; C-SPC to select items)

(require-package 'helm)
(require-package 'projectile)

(require 'helm)
;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
  In Delete Selection mode, if the mark is active, just deactivate it;
  then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
    (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(define-key helm-map [escape] 'helm-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(setq helm-quick-update t
      helm-apropos-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-semantic-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-locate-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match t
      helm-bookmark-show-location t
      helm-autoresize-mode 1)

(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'init-helm)
