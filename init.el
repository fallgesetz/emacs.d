;;load paths
(add-to-list 'load-path "~/.emacs.d/site-lisp/js2-mode")

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '(starter-kit starter-kit-lisp starter-kit-bindings durendal color-theme color-theme-solarized haskell-mode auctex)
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; syntax highlighting
(global-font-lock-mode 1)

;; solarized
(require 'color-theme)
(require 'color-theme-solarized)
(color-theme-solarized-dark)

;;durendal
(require 'durendal)
(durendal-enable)

;; IDO
(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;; haskell-mode
(add-to-list 'completion-ignored-extensions ".hi")
(or (fboundp 'haskell-mode)
    (let ((paths
           '("~/haskell-mode-2.8/haskell-site-file"
             "/usr/share/emacs/site-lisp/haskell-mode/haskell-site-file")))
      (while paths
        (if (not (file-exists-p (concat (car paths) ".el")))
            (setq paths (cdr paths))
          (load (car paths) t t)
          (setq paths nil)))))
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook (lambda () (require 'inf-haskell)))

;;js2-mode
(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


;; make ecb work with emacs 24, apparently
;; 
;; http://stackoverflow.com/questions/8833235/install-ecb-with-emacs-starter-kit-in-emacs-24

;;(setq stack-trace-on-error t)
;;(add-to-list 'load-path "~/.emacs.d/elpa/ecb")
;;(require 'ecb)
;;(ecb-activate)
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

