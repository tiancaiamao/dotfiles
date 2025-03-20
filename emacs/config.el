;; ====================== Setup ============================
;; Ensure that use-package is installed.
;; If use-package isn't already installed, it's extremely likely that this is a
;; fresh installation! So we'll want to update the package repository and
;; install use-package before loading the literate configuration.

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(unless (package-installed-p 'vterm)
  (package-install 'vterm))

(unless (package-installed-p 'exec-path-from-shell)
  (package-install 'exec-path-from-shell))

;; ==================== UI Settings ======================

;; Use a better theme
(use-package monokai-theme
  :config
  (load-theme 'monokai t))

;; Disable the startup message
(setq inhibit-startup-message t)

;; Tool bar and menu bar are useless, disable them.
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

;; Make the =yes or no= shorter.
(fset 'yes-or-no-p 'y-or-n-p)

;; Always display line number.
(global-display-line-numbers-mode 1)


;; ================== Key Bindings ======================
;; When I use macosx
(setq mac-command-modifier 'meta)

;; Yes, I use evil, the VIM keybinding makes life easier!
(use-package evil
  :init
  (setq evil-want-abbrev-expand-on-insert-exit nil
	evil-want-C-u-scroll t
	evil-want-integration t
	;; evil-collection will handle the key mapping, it requires this setting
	evil-want-keybinding nil
	)

  :config
  (evil-mode 1)
  (with-eval-after-load 'buff-menu
    ;; in buffer-menu-mode, k should be bind by evil-mode
    (define-key Buffer-menu-mode-map (kbd "k") nil)
    ))

;; package =evil-collection= comes with the evil keybinding.
(use-package evil-collection
  :after evil
  :custom
  (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

;; The leader key binding!
(use-package evil-leader
  :init
  (setq evil-leader/in-all-states 1)

  :config
  (global-evil-leader-mode))

(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ";" 'comment-or-uncomment-region
  "ff" 'find-file
  "fj" 'dired-jump
  "fs" 'save-buffer
  "bb" 'buffer-menu
  "bd" 'kill-buffer
  "bp" 'previous-buffer
  "bn" 'next-buffer
  "bc" 'switch-to-buffer
  "w" 'evil-window-map
  "w-" 'split-window-vertically
  "w/" 'split-window-horizontally
  "wj" 'windmove-down
  "wk" 'windmove-up
  "wh" 'windmove-left
  "wl" 'windmove-right
  "wc" 'delete-window
  "ww" 'other-window
  "50" 'delete-frame
  "pg" 'project-find-regexp
  "pc" 'project-compile
  ;; "p" 'projectile-command-map
  "oe" 'eshell
  "ot"  'vterm
  )

;; =============== Programming language ============== 

;; Go
(use-package go-mode)

;; Lisp
(use-package elisp-mode
  :ensure nil
  :bind
  (:map emacs-lisp-mode-map
	("C-c C-c" . me/eval-region-dwim)
	:map lisp-interaction-mode-map
	("C-c C-c" . me/eval-region-dwim))
  :hook
  (emacs-lisp-mode . outline-minor-mode))

(use-package lisp-mode
  :ensure nil
  :mode ((rx ".eld" eos) . lisp-data-mode))

;; Markdown
(use-package markdown-mode
  :mode (rx (or "INSTALL" "CONTRIBUTORS" "LICENSE" "README" ".mdx") eos)
  :bind
  (:map markdown-mode-map
	("M-n" . nil)
	("M-p" . nil))
  :hook
  (markdown-mode . me/hydra-set-super)
  :custom
  (markdown-asymmetric-header t)
  (markdown-split-window-direction 'right)
  :config
  (unbind-key "M-<down>" markdown-mode-map)
  (unbind-key "M-<up>" markdown-mode-map))

;; Yaml
(use-package yaml-mode)

;; indent for C language
(use-package editorconfig
  :config
  (add-hook 'c-mode-hook
	    (lambda ()
	      (setq c-basic-offset (if (eq indent-tabs-mode t)
				       tab-width
				     editorconfig-indentation)))))

;; ===================== Project management ===================
;; projectile 
;; I'm not sure what it is for now, but I'll figure it out one day.
(use-package projectile)


;; ===================== Misc ========================

(exec-path-from-shell-initialize)
;; (setq exec-path (append exec-path '("/home/genius/project/bin/")))
;; (setq exec-path (append exec-path '("/home/genius/project/go/bin/")))

;; This would make the 'e' shell alias focus on the new opened frame.
(defun px-raise-frame-and-give-focus ()
  (when window-system
    (raise-frame)
    (x-focus-frame (selected-frame))
    (set-mouse-pixel-position (selected-frame) 4 4)
    ))
(add-hook 'server-switch-hook 'px-raise-frame-and-give-focus)

;; So emacs daemon always there
(server-start)
