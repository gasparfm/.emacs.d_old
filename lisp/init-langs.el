
;;----------------------------------------------------------------------------
;; General for C-like languages
;;----------------------------------------------------------------------------
;; (add-hook 'c-mode-common-hook   'hs-minor-mode)
(setq-default c-basic-offset 2)
(setq-default tab-width 2)
(setq-default indent-tabs-mode 't)

;; Sets configuration for current file
(setq c-basic-offset 2)
(setq tab-width 2)
(setq indent-tabs-mode 't)

;; Indentation correct
;; (c-set-offset 'arglist-cont-nonempty 'tab-width)
;; (c-set-offset 'arglist-cont-nonempty tab-width)
(c-set-offset 'arglist-intro 't)
(c-set-offset 'arglist-close 0)

; From https://github.com/purcell/emacs.d/blob/master/lisp/init-markdown.el
;;----------------------------------------------------------------------------
;; Markdown mode
;;----------------------------------------------------------------------------
(when (maybe-require-package 'markdown-mode)
  (after-load 'whitespace-cleanup-mode
    (push 'markdown-mode whitespace-cleanup-mode-ignore-modes)))

;;----------------------------------------------------------------------------
;; CSV Mode
;;----------------------------------------------------------------------------

(require-package 'csv-mode)
(require-package 'csv-nav)

(add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

(setq csv-separators '("," ";" "|" " "))

;;----------------------------------------------------------------------------
;; PHP Mode
;;----------------------------------------------------------------------------
(when (maybe-require-package 'php-mode)
  (maybe-require-package 'smarty-mode))

(require-package 'ac-php)
(add-hook 'php-mode-hook '(lambda ()
                           (auto-complete-mode t)
                           (require 'ac-php)
                           (setq ac-sources  '(ac-source-php ) )
                           (yas-global-mode 1)

                           (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
                           (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
                           ))

;;----------------------------------------------------------------------------
;; HTML Mode
;;----------------------------------------------------------------------------
(require-package 'tidy)
(add-hook 'html-mode-hook (lambda () (tidy-build-menu html-mode-map)))

(require-package 'tagedit)
(after-load 'sgml-mode
  (tagedit-add-paredit-like-keybindings)
  (add-hook 'sgml-mode-hook (lambda () (tagedit-mode 1))))

(add-auto-mode 'html-mode "\\.\\(jsp\\|tmpl\\)\\'")

;;----------------------------------------------------------------------------
;; Python Mode
;;----------------------------------------------------------------------------
(setq auto-mode-alist
      (append '(("SConstruct\\'" . python-mode)
		("SConscript\\'" . python-mode))
              auto-mode-alist))

(require-package 'pip-requirements)

(when (maybe-require-package 'anaconda-mode)
  (after-load 'python
    (add-hook 'python-mode-hook 'anaconda-mode)
    (add-hook 'python-mode-hook 'anaconda-eldoc-mode))
  (when (maybe-require-package 'company-anaconda)
    (after-load 'company
      (add-hook 'python-mode-hook
                (lambda () (sanityinc/local-push-company-backend 'company-anaconda))))))

;;----------------------------------------------------------------------------
;; CSS Mode
;;----------------------------------------------------------------------------
(setq-default cssm-indent-level 4)
(setq-default cssm-newline-before-closing-bracket t)
(setq-default cssm-indent-function #'cssm-c-style-indenter)
;; (setq-default scss-sass-command '/usr/local/bin/sass)
(setq-default cssm-mirror-mode nil)

;;----------------------------------------------------------------------------
;; Web mode
;;----------------------------------------------------------------------------
(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

;;----------------------------------------------------------------------------
;; Some more mode languages
;;----------------------------------------------------------------------------
(require-package 'gnuplot)
(require-package 'lua-mode)
(require-package 'ansible)
(require-package 'elf-mode)

(provide 'init-langs)

