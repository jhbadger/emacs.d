;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(add-hook 'after-init-hook #'global-flycheck-mode)
(setq inferior-lisp-program "sbcl")
(setq w32-pass-apps-to-system nil)
(setq w32-apps-modifier 'hyper)

(add-to-list 'auto-mode-alist '("\\.pro\\'" . prolog-mode))
(ac-config-default)
(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)

(setq forth-executable "/Users/badgerjh/bin/pforth")

(defun notebook ()
  (interactive)
  (find-file (expand-file-name "~/Dropbox/notebook/main.md")))

(global-set-key [f2] 'notebook)

(global-set-key [f5] 'compile)
(setenv "GOPATH" (concat (getenv "HOME") "/go"))
(setenv "RUBYLIB" "/Users/badgerjh/scripts")
(add-to-list 'exec-path (concat (getenv "GOPATH") "/bin"))

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)
(add-hook 'before-save-hook 'gofmt-before-save)

(add-to-list 'load-path "~/.emacs.d/lisp")
(defun turn-off-trailing-whitespace ()
  (setq show-trailing-whitespace nil))
(show-paren-mode 1)

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setq make-backup-files nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq-default ispell-list-command "list")
(global-set-key [f7] 'paredit-mode)


(setq-default ispell-program-name "/usr/local/bin/aspell")
(require 'cl-lib)

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

(autoload 'red-mode "red.el"
  "Major mode for red files" t)
(add-to-list 'auto-mode-alist '("\\.red$" . red-mode))
(add-to-list 'interpreter-mode-alist '("red" . red-mode))

(add-hook 'nim-mode-hook 'nimsuggest-mode)
(setq nimsuggest-path "/usr/local/bin/nimsuggest")
(defun my-nim-mode-config ()
  "For use in `nim-mode-hook'."
  (local-set-key (kbd "<f5>") 'nim-compile) ; add a key
  (local-set-key (kbd "H-c") 'nim-compile) ; add a key
)

(if (not (fboundp 'filter))
(defun filter (condp lst)
  (delq nil
	(mapcar (lambda (x) (and (funcall condp x) x)) lst))))

(defun sum (s)
  "return sum of list"
  (apply '+ s))

(defun product (s)
  "return sum of list"
  (apply '* s))

(defun mean (s)
  "return mean of list"
  (/ (* 1.0 (sum s)) (length s)))

(defun median (s)
  "return median of list"
  (let* ((len (length s))
	(hlen (/ len 2)))
    (if (= 1 (% len 2))
	(nth hlen s)
      (/ (+ (nth hlen s) (nth (- hlen 1) s)) 2.0)
      )))

(defun var (s)
  "return variance of list"
  (let ((m (mean s))
	(l (- (length s) 1)))
    (/ (sum (mapcar (lambda (x) (* (- x m) (- x m))) s )) l)))

(defun sd (s)
  "return standard deviation of list"
  (sqrt (var s)))

(defun standardize (s)
  "return standardized form of list s with mean 0 and sd 1"
  (let ((m (mean s)) (std (sd s)))
    (mapcar (lambda (x) (/ x std))
	    (mapcar (lambda (x) (- x m))  s))))


(defmacro ->> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append form (list result))))))

(defmacro -> (&rest body)
  (let ((result (pop body)))
    (dolist (form body result)
      (setq result (append (list (car form) result)
			   (cdr form))))))

;; add to hook
(add-hook 'nim-mode-hook 'my-nim-mode-config)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-allow-jack-in-without-project (quote t))
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (lua-mode vala-mode htmlize zig-mode dash-functional nov forth-mode picolisp-mode markdown-mode flycheck-nim flycheck-nimsuggest org-ac dna-mode ac-slime ac-geiser typescript-mode cider newlisp-mode slime js2-mode js-comint kotlin-mode rust-mode swift-mode suggest nim-mode clojure-mode flycheck geiser go-autocomplete paredit))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key (kbd "C-x C-e") 'js-send-last-sexp)
            (local-set-key (kbd "C-M-x") 'js-send-last-sexp-and-go)
            (local-set-key (kbd "C-c b") 'js-send-buffer)
            (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)
            (local-set-key (kbd "C-c l") 'js-load-file-and-go)))

(add-hook 'zig-mode-hook (lambda () (setq indent-tabs-mode nil)))
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/learn.org" 
                             "~/org/home.org"))
;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (ruby . t)
   (python . t)))

(setq org-confirm-babel-evaluate nil
      org-src-fontify-natively t
      org-src-tab-acts-natively t)

(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))
(setq eshell-cmpl-cycle-completions nil)
