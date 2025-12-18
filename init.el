(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (and custom-file
	   (file-exists-p custom-file))
    (load custom-file nil :nomessage))

(load "~/.emacs.d/crafted-emacs/modules/crafted-init-config")

;; Add package definitions for completion packages
;; to `package-selected-packages'.
(require 'crafted-completion-packages)

;; fix for warning from `crafted-completion-packages`
(add-to-list 'package-selected-packages 'embark-consult)

;; Manually select "ef-themes" package
(add-to-list 'package-selected-packages 'ef-themes)

;; adding the `:noconfirm' flag will cause all the packages listed in
;; the `package-selected-packages' variable to be installed without
;; prompting you to confirm that choice.
(package-install-selected-packages :noconfirm)

;; load configuration for the completion packages
(require 'crafted-completion-config)

(defconst my-config-dir (expand-file-name "modules" user-emacs-directory))

;; modules 폴더가 없으면 생성
(unless (file-exists-p my-config-dir)
  (make-directory my-config-dir))

;; 폴더 내의 모든 .el 파일을 로드
(mapc 'load (directory-files my-config-dir 't "^[^#].*el$"))
