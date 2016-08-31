;; Load misc modules and bind keys to them

(require-package 'neotree)

;;----------------------------------------------------------------------------
;; Uniquify - Provides unique names for files
;;----------------------------------------------------------------------------

(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
(setq uniquify-separator " • ")
(setq uniquify-after-kill-buffer-p t)
(setq uniquify-ignore-buffers-re "^\\*")

;;----------------------------------------------------------------------------
;; Flycheck - real time code check
;;----------------------------------------------------------------------------

(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list))

;;----------------------------------------------------------------------------
;; Recent files
;;----------------------------------------------------------------------------

(recentf-mode 1)
(setq-default
 recentf-max-saved-items 1000
 recentf-exclude '("/tmp/" "/ssh:"))

;;----------------------------------------------------------------------------
;; Smex - better minibuffer
;;----------------------------------------------------------------------------
(when (maybe-require-package 'smex)
  ;; Change path for ~/.smex-items
  (setq-default smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
  (global-set-key [remap execute-extended-command] 'smex))

;;----------------------------------------------------------------------------
;; Multiple major modes
;;----------------------------------------------------------------------------
(require-package 'mmm-mode)
(require 'mmm-auto)
(setq mmm-global-mode 'buffers-with-submode-classes)
(setq mmm-submode-decoration-level 2)

;;----------------------------------------------------------------------------
;; Spell
;;----------------------------------------------------------------------------
(require-package 'ispell)
(require-package 'flyspell)
(require 'init-flyspell)

;;----------------------------------------------------------------------------
;; More things
;;----------------------------------------------------------------------------
(require-package 'htmlize)
(require-package 'regex-tool)
(require-package 'yasnippet)
(require 'yasnippet)
(yas-global-mode 1)
(require-package 'visual-regexp)
(require 'visual-regexp)
(require-package 'annotate)
(require-package 'restclient)

;; (if (fboundp 'prog-mode)
;;     (add-hook 'prog-mode-hook 'annotate-mode)
;;   (dolist (hook '(lisp-mode-hook
;;                   emacs-lisp-mode-hook
;;                   scheme-mode-hook
;;                   clojure-mode-hook
;;                   ruby-mode-hook
;;                   yaml-mode
;;                   python-mode-hook
;;                   shell-mode-hook
;;                   php-mode-hook
;;                   css-mode-hook
;;                   haskell-mode-hook
;;                   caml-mode-hook
;;                   nxml-mode-hook
;;                   crontab-mode-hook
;;                   perl-mode-hook
;;                   tcl-mode-hook
;;                   javascript-mode-hook))
;;     (add-hook hook 'annotate-mode)))

;;----------------------------------------------------------------------------
;; Configure keys
;;----------------------------------------------------------------------------
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "s-r") 'recentf-open-files)

(provide 'init-misc)
