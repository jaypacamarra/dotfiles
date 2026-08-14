(setq custom-file "~/.config/emacs/.emacs.custom.el")
(package-initialize)

(load "~/.config/emacs/.emacs.rc/rc.el")

;;; Appearance
(set-face-attribute 'default nil :height 140)

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

(rc/require 'markdown-mode)

(evil-mode 1)

;; tell evil to use xref-goto-xref on RET when in xref buffers
(evil-define-key 'normal xref--xref-buffer-mode-map
  (kbd "RET") #'xref-goto-xref)

(setq display-line-numbers-type 'relative)
(setq tags-case-fold-search nil)
(global-display-line-numbers-mode)

(rc/require 'cmake-mode)

(setq treesit-language-source-alist
      '((c "https://github.com/tree-sitter/tree-sitter-c" "v0.23.6")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.23.2")))

(add-to-list 'major-mode-remap-alist
             '(c-mode . c-ts-mode))

(add-to-list 'major-mode-remap-alist
             '(c++-mode . c++-ts-mode))

;;; tabs and spaces
;; figures out how many spaces to use for
;; indents based on current usage in file
(rc/require 'dtrt-indent)

;; Use spaces when indenting
(setq-default indent-tabs-mode nil)

;; Display/interpret a TAB as 8 columns
(setq-default tab-width 8)

(when (boundp 'custom-file)
  (unless (file-exists-p custom-file)
    (write-region "" nil custom-file))
  (load-file custom-file))
