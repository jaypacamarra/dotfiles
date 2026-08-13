(setq custom-file "~/.emacs.custom.el")
(package-initialize)

(load "~/.config/emacs/.emacs.rc/rc.el")

;;; Appearance

;; disable the ugly startup screen
(setq inhibit-startup-screen t)

;; minimal UI = 10x life
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; theme
(rc/require-theme 'gruber-darker)

;; ido
(ido-mode 1)
(ido-everywhere 1)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-want-C-u-scroll t)
(setq evil-default-state 'normal)

;; Enable Evil
(rc/require 'evil)

(rc/require 'vterm)

(evil-mode 1)

(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

(load-file custom-file)
