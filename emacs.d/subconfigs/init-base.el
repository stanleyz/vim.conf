(menu-bar-mode -1)
(tool-bar-mode -1)

;; fullscreen
(custom-set-variables
  '(initial-frame-alist (quote ((fullscreen . maximized)))))

(setq inhibit-startup-screen 1)
(setq make-backup-files nil)

;; No more typing the whole yes or no. Just y or n will do.
(fset 'yes-or-no-p 'y-or-n-p)

;; Mode line setup
(setq-default
  mode-line-format
  '(; Position, including warning for 80 columns
    ("%l:")
    (:eval (propertize "%c" 'face
                       (if (>= (current-column) 80)
                         'mode-line-80col-face)))
    ; emacsclient [default -- keep?]
    mode-line-client
    "  "
    ; read-only or modified status
    (:eval
      (cond (buffer-read-only
              (propertize " RO " 'face 'mode-line-read-only-face))
            ((buffer-modified-p)
             (propertize " ** " 'face 'mode-line-modified-face))
            (t "      ")))
    "    "
    ; directory and buffer/file name
    (:propertize (:eval (shorten-directory default-directory 30))
                 face mode-line-folder-face)
    (:propertize "%b"
                 face mode-line-filename-face)
    ; narrow [default -- keep?]
    " %n "
    ; mode indicators: vc, recursive edit, major mode, minor modes, process, global
    (vc-mode vc-mode)
    "  %["
    (:propertize mode-name
                 face mode-line-mode-face)
    "%] "
    (:eval (propertize (format-mode-line minor-mode-alist)
                       'face 'mode-line-minor-mode-face))
    (:propertize mode-line-process
                 face mode-line-process-face)
    (global-mode-string global-mode-string)
    "    "
    ; nyan-mode uses nyan cat as an alternative to %p
    (:eval (when nyan-mode (list (nyan-create))))

    (:eval
       (let ((host-name
               (if (file-remote-p default-directory)
                 (tramp-file-name-host
                   (tramp-dissect-file-name default-directory))
                 (system-name))))
         (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
           (substring host-name 0 (match-beginning 1))
           host-name)))
  )
)

;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
           (setq output (concat (car path) "/" output))
           (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
                    :foreground "gray60" :background "gray20"
                    :inverse-video nil
                    :box '(:color "gray20" :style nil))
(set-face-attribute 'mode-line-inactive nil
                    :foreground "gray80" :background "gray40"
                    :inverse-video nil
                    :box '(:color "gray40" :style nil))

(set-face-attribute 'mode-line-read-only-face nil
                    :inherit 'mode-line-face
                    :foreground "#eab700"
                    :box '(:line-width 2 :color "#eab700"))
(set-face-attribute 'mode-line-modified-face nil
                    :inherit 'mode-line-face
                    :foreground "#c82829"
                    :background "#ffffff"
                    :box '(:line-width 2 :color "#c82829"))
(set-face-attribute 'mode-line-folder-face nil
                    :inherit 'mode-line-face
                    :foreground "gray60")
(set-face-attribute 'mode-line-filename-face nil
                    :inherit 'mode-line-face
                    :foreground "#eab700"
                    :weight 'bold)
(set-face-attribute 'mode-line-mode-face nil
                    :inherit 'mode-line-face
                    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
                    :inherit 'mode-line-mode-face
                    :foreground "gray40"
                    :height 100)
(set-face-attribute 'mode-line-process-face nil
                    :inherit 'mode-line-face
                    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
                    :foreground "black" :background "#eab700")

(provide 'init-base)
