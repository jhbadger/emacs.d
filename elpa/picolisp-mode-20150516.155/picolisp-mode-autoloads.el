;;; picolisp-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "picolisp-mode" "picolisp-mode.el" (22146 61599
;;;;;;  0 0))
;;; Generated autoloads from picolisp-mode.el

(autoload 'picolisp-mode "picolisp-mode" "\
Major mode for PicoLisp programming. Derived from lisp-mode.

\\{picolisp-mode-map}

\(fn)" t nil)

(autoload 'picolisp-repl-mode "picolisp-mode" "\
Major mode for `pil' REPL sessions. Derived from comint-mode.

\\{picolisp-repl-mode-map}

\(fn)" t nil)

(autoload 'picolisp-repl "picolisp-mode" "\
Start a `pil' session in a new `picolisp-repl-mode' buffer.

\(fn)" t nil)

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; picolisp-mode-autoloads.el ends here
