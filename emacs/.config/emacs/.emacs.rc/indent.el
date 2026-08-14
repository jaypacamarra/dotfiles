;;; indent.el --- Linux kernel style indentation -*- lexical-binding: t; -*-

(defvar rc/indent-width 8
  "Default indent width in columns (Linux kernel style uses tabs at this width).")

(defun rc/apply-indent-width (&optional width)
  "Apply WIDTH as the indent step in the current buffer.
When called interactively, prompt for WIDTH."
  (interactive "nIndent width: ")
  (setq width (or width rc/indent-width))
  (setq rc/indent-width width)
  (setq-local tab-width width)
  (setq-local evil-shift-width width)
  (when (derived-mode-p 'c-ts-mode 'c++-ts-mode)
    (setq-local c-ts-mode-indent-style 'linux)
    (setq-local c-ts-mode-indent-offset width)
    (setq-local indent-tabs-mode t))
  (when (derived-mode-p 'c-mode 'c++-mode)
    (setq-local c-basic-offset width)
    (setq-local indent-tabs-mode t))
  (message "Indent width set to %d (tabs, Linux style)" width))

(defun rc/indent-width-increase (arg)
  "Increase indent width by ARG (default 1)."
  (interactive "P")
  (rc/apply-indent-width (+ rc/indent-width (or arg 1))))

(defun rc/indent-width-decrease (arg)
  "Decrease indent width by ARG (default 1), minimum 1."
  (interactive "P")
  (rc/apply-indent-width (max 1 (- rc/indent-width (or arg 1)))))

(defun rc/c-ts-mode-setup ()
  "Configure Linux kernel style indentation for C/C++ tree-sitter modes."
  (setq-local c-ts-mode-indent-style 'linux)
  (setq-local c-ts-mode-indent-offset rc/indent-width)
  (setq-local tab-width rc/indent-width)
  (setq-local evil-shift-width rc/indent-width)
  (setq-local indent-tabs-mode t))

;; Linux kernel style: tab characters displayed at 8 columns.
(setq-default tab-width rc/indent-width)
(setq-default indent-tabs-mode t)
(setq-default evil-shift-width rc/indent-width)
(setq-default electric-indent-mode t)

(add-hook 'c-ts-mode-hook #'rc/c-ts-mode-setup)
(add-hook 'c++-ts-mode-hook #'rc/c-ts-mode-setup)

(global-set-key (kbd "C-c C-i") #'rc/apply-indent-width)
(global-set-key (kbd "C-c +") #'rc/indent-width-increase)
(global-set-key (kbd "C-c -") #'rc/indent-width-decrease)

(provide 'indent)
