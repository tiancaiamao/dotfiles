;; Configure package.el to include MELPA.
;; Replace the source to China for some reasons everyone knows here.
(require 'package)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("nongnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
			 ("melpa"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(package-initialize)

(load-file "~/.emacs.d/config.el")

(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)
