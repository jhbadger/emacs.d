;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; make PC keyboard's Win key or other to type Super or Hyper,
;; for emacs running on Windows.
(setq w32-pass-lwindow-to-system nil)
(setq w32-lwindow-modifier 'super) ; Left Windows key

(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(slime-setup '(slime-fancy)) 
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)
(require 'package)
(byte-recompile-directory (expand-file-name "~/.emacs.d") 0)
(add-to-list 'package-archives '("marmalade" .
				 "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("Melpa" .
				 "https://melpa.org/packages/") t)

(setenv "GOPATH" (concat (getenv "HOME") "/go"))
(add-to-list 'exec-path (concat (getenv "GOPATH") "/bin"))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-to-list 'load-path "~/.emacs.d/lisp")
(defun turn-off-trailing-whitespace ()
  (setq show-trailing-whitespace nil))
(show-paren-mode 1)


(exec-path-from-shell-initialize)
(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default ispell-list-command "list")
(global-set-key [f7] 'paredit-mode)


(if (eq system-type 'darwin)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
  (setq-default ispell-program-name "/usr/bin/aspell"))


(defun xlispstat ()
  (interactive)
  (inferior-lisp "xlispstat"))

(setq calendar-latitude 39.0836)
(setq calendar-longitude -77.1483)
(setq calendar-location-name "Rockville, MD")

(autoload 'crystal-mode "emacs-crystal-mode/crystal-mode"
  "Major mode for crystal files" t)
(add-to-list 'auto-mode-alist '("\\.cr$" . crystal-mode))
(add-to-list 'interpreter-mode-alist '("crystal" . crystal-mode))

(defun my-nim-mode-config ()
  "For use in `nim-mode-hook'."
  (local-set-key (kbd "<f5>") 'nim-compile) ; add a key
  (local-set-key (kbd "s-c") 'nim-compile) ; add a key
)

;; add to hook
(add-hook 'nim-mode-hook 'my-nim-mode-config)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (exec-path-from-shell nim-mode inf-clojure clojure-mode slime flycheck geiser go-autocomplete paredit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
