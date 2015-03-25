(setq user-full-name "Stanley Zhang")
(setq user-mail-address "stanley.zhang@ityin.net")

(add-to-list 'load-path (expand-file-name "subconfigs" user-emacs-directory))

(require 'init-packages)
(require 'init-base)
(require 'init-evil)
(require 'init-helm)
(require 'init-ido)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
