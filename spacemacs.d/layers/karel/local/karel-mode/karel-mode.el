;;; karel-mode.el --- Fanuc KAREL syntax highlighting
(setq karel-font-lock-keywords
      (let* (
             ;; define several category of keywords
             (x-keywords '("BEGIN"
                           "END" "do" "else" "for" "if" "return" "state" "while"))
             (x-types '("BOOLEAN"
                        "FILE"
                        "INTEGER"
                        "REAL"
                        "STRING"
                        "ARRAY OF BYTE"
                        "ARRAY OF SHORT"
                        "CAM_SETUP"
                        "CONFIG"
                        "JOINTPOS1"
                        "JOINTPOS2"
                        "JOINTPOS3"
                        "JOINTPOS4"
                        "JOINTPOS5"
                        "JOINTPOS6"
                        "JOINTPOS7"
                        "JOINTPOS8"
                        "JOINTPOS9"
                        "JOINTPOS"
                        "MODEL"
                        "PATH"
                        "POSITION"
                        "QUEUE_TYPE"
                        "VECTOR"
                        "VIS_PROCESS"
                        "XYZWPREXT"
                        "XYZWPR"))
             (x-constants '("ACTIVE" "AGENT" "ALL_SIDES" "ATTACH_BACK"))
             (x-events '("at_rot_target" "at_target" "attach"))
             (x-functions '("llAbs" "llAcos" "llAddToLandBanList" "llAddToLandPassList"))

             ;; generate regex string for each category of keywords
             (x-keywords-regexp (regexp-opt x-keywords 'words))
             (x-types-regexp (regexp-opt x-types 'words))
             (x-constants-regexp (regexp-opt x-constants 'words))
             (x-events-regexp (regexp-opt x-events 'words))
             (x-functions-regexp (regexp-opt x-functions 'words)))

        `(
          (,x-types-regexp . font-lock-type-face)
          (,x-constants-regexp . font-lock-constant-face)
          (,x-events-regexp . font-lock-builtin-face)
          (,x-functions-regexp . font-lock-function-name-face)
          (,x-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters, because once colored, that part won't change.
          ;; in general, put longer words first
          )))

;;;###autoload
(define-derived-mode karel-mode fundamental-mode "Fanuc-KAREL"
  "Major mode for editing KAREL"
  (setq font-lock-defaults '((karel-font-lock-keywords))))

(provide 'karel-mode)

;;; karel-mode.el ends here
