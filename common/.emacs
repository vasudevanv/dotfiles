;; .emacs

(add-to-list 'load-path "~/.emacs.d/packages/")

;; Uncomment this line to disable loading of "default.el" at startup
(setq inhibit-default-init t)
(setq inhibit-startup-message t)

;; Turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; Enable visual feedback on selections
(setq transient-mark-mode t)

;; Default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; Default to unified diffs
(setq diff-switches "-u")

;; Always end a file with a newline
(setq require-final-newline 'query)

;; Color scheme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'spolsky t)

;; C/C++ indentation
(setq c-default-style "linux"
      c-basic-offset 4)

;; f90 indentation
(custom-set-variables
 '(enable-completion nil)
 '(f90-continuation-indent 6)
 '(f90-do-indent 3)
 '(f90-if-indent 3)
 '(f90-program-indent 3)
 '(f90-type-indent 3)
 '(inhibit-startup-screen t)
 '(rst-level-face-base-light 40)
 '(rst-level-face-step-light 0)
 '(save-completions-flag nil)
 '(transient-mark-mode nil))

;; f95 indentation
(setq auto-mode-alist (append auto-mode-alist
(list '("\\.f95$" . f90-mode))
(list '("\\.F95$" . f90-mode))
(list '("\\.F95$" . f90-mode))))

;; Emacs org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Cython
(require 'cython-mode)
(add-to-list 'auto-mode-alist '("\\.pyx\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxd\\'" . cython-mode))
(add-to-list 'auto-mode-alist '("\\.pxi\\'" . cython-mode))

;; Turn off backups
(setq make-backup-files nil)
(setq delete-auto-save-files 1)

;; Set default font
(set-face-attribute 'default nil :font "Droid Sans Mono-12")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Approximate character count (exact byte count)
(add-to-list 'global-mode-string '(" %i"))
