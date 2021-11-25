;; Configure package.el to include MELPA.
;; Replace the source to China for some reasons everyone knows here.
(require 'package)
(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(package-initialize)

;; Ensure that use-package is installed.
;; If use-package isn't already installed, it's extremely likely that this is a
;; fresh installation! So we'll want to update the package repository and
;; install use-package before loading the literate configuration.
(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; (require 'org)
;; (org-babel-do-load-languages
;;    'org-babel-load-languages
;;    '((emacs-lisp . t)
;;      (shell . t)))

(org-babel-load-file "~/.emacs.d/config.org")

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(package-selected-packages
;;    '(use-package yaml-mode nim-mode pyim-wbdict pyim s epc deferred ctable go-projectile monokai-theme markdown-mode exec-path-from-shell go-mode evil-leader)))

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
