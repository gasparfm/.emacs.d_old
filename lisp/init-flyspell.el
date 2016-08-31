;; From https://github.com/purcell/emacs.d/blob/master/lisp/init-flyspell.el
;;----------------------------------------------------------------------------
;; Add spell-checking in comments for all programming language modes
;;----------------------------------------------------------------------------
(if (fboundp 'prog-mode)
    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (dolist (hook '(lisp-mode-hook
                  emacs-lisp-mode-hook
                  scheme-mode-hook
                  clojure-mode-hook
                  ruby-mode-hook
                  yaml-mode
									c-mode
									c++-mode
                  python-mode-hook
                  shell-mode-hook
                  php-mode-hook
                  css-mode-hook
                  haskell-mode-hook
                  caml-mode-hook
                  nxml-mode-hook
                  crontab-mode-hook
                  perl-mode-hook
                  tcl-mode-hook
                  javascript-mode-hook))
    (add-hook hook 'flyspell-prog-mode)))

(after-load 'flyspell
  (add-to-list 'flyspell-prog-text-faces 'nxml-text-face))

; From https://www.emacswiki.org/emacs/FlySpell#toc5
(let ((langs '("english" "spanish")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))
(defun myemacs/cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))
    
(global-set-key (kbd "s-d")   'myemacs/cycle-ispell-languages)

(provide 'init-flyspell)
