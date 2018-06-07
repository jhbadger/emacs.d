;;; zig-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "zig-mode" "zig-mode.el" (0 0 0 0))
;;; Generated autoloads from zig-mode.el

(autoload 'zig-mode "zig-mode" "\
A major mode for the zig programming language.

\(fn)" t nil)

(add-to-list 'auto-mode-alist '("\\.zig\\'" . zig-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "zig-mode" '("zig-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; zig-mode-autoloads.el ends here
