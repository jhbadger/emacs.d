(require 'package)
(setq-default indent-tabs-mode nil)
(setq large-file-warning-threshold 100000000)
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
    (sly smalltalk-mode company zig-mode malyon haskell-mode elm-mode w3m nov paredit-menu ess ob-hy hy-mode crystal-mode ob-nim ob-prolog ruby-compilation nim-mode cider))))

(add-hook 'after-init-hook 'global-company-mode)

; No delay in showing suggestions.
(setq company-idle-delay 0)
; Show suggestions after entering one character.
(setq company-minimum-prefix-length 1)


(eval-after-load 'cider
  '(progn
     (add-hook 'clojure-mode-hook 'cider-mode)
     (add-hook 'cider-repl-mode-hook 'paredit-mode)))

(setq org-confirm-babel-evaluate nil)
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (ruby . t)
   (python . t)
   (hy . t)
   (nim . t)
   ))
(setenv "RUBYLIB" (concat (getenv "HOME") "/scripts"))
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))
(setenv "PATH" (concat (getenv "HOME") "/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/bin" exec-path))

(setq ispell-program-name
      (shell-command-to-string "which ispell"))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(global-set-key [f5] 'compile)
(global-set-key (kbd "M-p") 'paredit-mode)
(global-set-key (kbd "M-c") 'compile)

(defun my-nim-mode-config ()
  "For use in `nim-mode-hook'."
  (local-set-key (kbd "<f5>") 'nim-compile)
  (local-set-key (kbd "H-c") 'nim-compile)
  )
(add-hook 'nim-mode-hook 'my-nim-mode-config)


(defun my-racket-mode-config ()
  (local-set-key (kbd "M-p") 'paredit-mode)
  (local-set-key (kbd "M-r") 'racket-run)
  (local-set-key (kbd "M-n") 'racket-describe)
  )
(add-hook 'racket-mode-hook 'my-racket-mode-config)
(add-hook 'racket-repl-mode-hook 'my-racket-mode-config)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
