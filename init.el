(require 'package)
(load-theme 'tango-dark)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (nov paredit-menu auto-complete ess ob-hy hy-mode crystal-mode slime ob-nim ob-prolog ruby-compilation nim-mode cider))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ac-config-default)
(setq org-confirm-babel-evaluate nil)
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (ruby . t)
   ))
(setenv "RUBYLIB" "/Users/badgerjh/scripts")
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/bin:" exec-path))

(setq ispell-program-name
      (string-trim (shell-command-to-string "which ispell")))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(global-set-key [f5] 'compile)
(global-set-key [f7] 'paredit-mode)
(defun my-nim-mode-config ()
  "For use in `nim-mode-hook'."
  (local-set-key (kbd "<f5>") 'nim-compile) ; add a key
  (local-set-key (kbd "H-c") 'nim-compile) ; add a key
  )
