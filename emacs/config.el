(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)

(unless (package-installed-p 'evil)
  (package-install 'evil))

(use-package monokai-theme
  :config
  (load-theme 'monokai t))

(setq inhibit-startup-message t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(fset 'yes-or-no-p 'y-or-n-p)

(global-display-line-numbers-mode 1)

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

(use-package evil-collection
  :after evil
  :custom
  (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init))

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
  ;; "mci" 'org-clock-in
  ;; "mco" 'org-clock-out
  ;; "mcg" 'org-clock-goto
  ;; "mcr" 'org-clock-report
  ;; "mc=" 'org-clock-display
  ;; "mt"  'org-todo
  ;; "ms" 'org-schedule
  ;; "md" 'org-done
  ;; "mq" 'org-set-tags-command
  )

(use-package go-mode)

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

(use-package yaml-mode)

(use-package projectile)

(server-start)

(exec-path-from-shell-initialize)
;; (setq exec-path (append exec-path '("/home/genius/project/bin/")))
(setq exec-path (append exec-path '("/home/genius/project/go/bin/")))

(defun px-raise-frame-and-give-focus ()
  (when window-system
    (raise-frame)
    (x-focus-frame (selected-frame))
    (set-mouse-pixel-position (selected-frame) 4 4)
    ))
(add-hook 'server-switch-hook 'px-raise-frame-and-give-focus)
