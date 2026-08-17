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
(column-number-mode 1)

;; theme
(rc/require-theme 'gruber-darker)

;; ido
(ido-mode 1)
(ido-everywhere 1)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-default-state 'normal)

;; Enable Evil
(rc/require 'evil)
(rc/require 'evil-collection)

(rc/require 'vterm)

(rc/require 'markdown-mode)

(evil-mode 1)
(evil-collection-init)

;; tell evil to use xref-goto-xref on RET when in xref buffers
(evil-define-key 'normal xref--xref-buffer-mode-map
  (kbd "RET") #'xref-goto-xref)

;; tell evil to use emacs builtin tab-to-tab-stop func on TAB in insert mode
(evil-define-key 'insert 'global
  (kbd "TAB") #'tab-to-tab-stop)

(setq display-line-numbers-type 'relative)
(setq tags-case-fold-search nil)
(global-display-line-numbers-mode)

(rc/require 'cmake-mode)

(setq treesit-language-source-alist
      '((c "https://github.com/tree-sitter/tree-sitter-c" "v0.23.6")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp" "v0.23.2")))

(defun my-underscore-is-word ()
  (modify-syntax-entry ?_ "w"))

(add-to-list 'major-mode-remap-alist
             '(c-mode . c-ts-mode))

(add-to-list 'major-mode-remap-alist
             '(c++-mode . c++-ts-mode))

(add-hook 'c-ts-mode-hook #'my-underscore-is-word)
(add-hook 'c++-ts-mode-hook #'my-underscore-is-word)

;;; tabs and spaces (Linux kernel style; see .emacs.rc/indent.el)
(load "~/.config/emacs/.emacs.rc/indent.el")

;; magit
(rc/require 'magit)

;; suppress annoying *Warnings* buffer that pops up
(add-to-list 'display-buffer-alist
             '("\\*Warnings\\*"
               (display-buffer-no-window)
               (allow-no-window . t)))

;; turn off line wrap
(setq-default truncate-lines t)

;; vertico - vertical completion UI
(rc/require 'vertico)
(vertico-mode)

;; orderless - for better matching
(rc/require 'orderless)

(rc/require 'consult)
(global-set-key (kbd "C-c g") #'consult-ripgrep)
(global-set-key (kbd "C-x p g") #'consult-ripgrep)

;; C/C++ macros (all caps) get font-lock-const-face in c/c++ ts modes
(defun my-c-font-lock ()
  (font-lock-add-keywords
   nil
   '(("\\_<[A-Z][A-Z0-9_]+\\_>"
      . font-lock-constant-face))))

(add-hook 'c-ts-mode-hook #'my-c-font-lock)
(add-hook 'c++-ts-mode-hook #'my-c-font-lock)

;; function call syntax highlighting
(defun my-c-function-call-highlighting ()
  (font-lock-add-keywords
   nil
   '(("\\_<\\([[:alpha:]_][[:alnum:]_]*\\)\\_>[[:space:]]*("
      1 'font-lock-function-call-face))))

(add-hook 'c-ts-mode-hook #'my-c-function-call-highlighting)
(add-hook 'c++-ts-mode-hook #'my-c-function-call-highlighting)

;; vterm perf
(add-hook 'vterm-mode-hook
          (lambda ()
            (display-line-numbers-mode -1)))

(when (boundp 'custom-file)
  (unless (file-exists-p custom-file)
    (write-region "" nil custom-file))
  (load-file custom-file))
