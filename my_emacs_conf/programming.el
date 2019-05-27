;; ESS

(require 'ess-site)


;; GIT

;; (add-hook 'kill-emacs-hook (shell-command "ssh daniel@koiserver.ddns.net; git add ~/documents/; git commit -m 'backup'; git stash; git pull -r ; git push; git stash apply &"))

;; PYTHON

(elpy-enable)

(pyvenv-activate "/anaconda3/envs/py3")

;; enable ipython
;; (elpy-use-ipython)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(add-hook 'python-mode-hook 'linum-mode)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))
(setq elpy-rpc-backend "jedi")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; enable autopep8 formatting on save
(require 'py-autopep8)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; (exec-path-from-shell-copy-env "/ssh:daniel@koiserver.ddns.net:~/.bashrc")

(require 'pyenv-mode)

(defun projectile-pyenv-mode-set ()
  "Set pyenv version matching project name."
  (let ((project (projectile-project-name)))
    (if (member project (pyenv-mode-versions))
        (pyenv-mode-set project)
      (pyenv-mode-unset))))

(add-hook 'projectile-after-switch-project-hook 'projectile-pyenv-mode-set)


;; ;; org 2 jupyter

;; (export-ipynb-buffer)

;; * HS MINOR MODE

(load-library "hideshow")
(global-set-key (kbd "C-c +") 'hs-show-block)
(global-set-key (kbd "C-c -") 'hs-hide-block)

(add-hook 'elpy-mode-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)

;; * HI-LOCK MODE

(global-hi-lock-mode 1)

;; * ELECTRIC PAIR MODE

(electric-pair-mode 1)

;; make electric-pair-mode work on more brackets
(setq electric-pair-pairs '(
                            ;; (?\" . ?\")
                            (?\{ . ?\})
                            ) )
;; (add-hook 'org-mode-hook
;; 	  (lambda ()
;; 	    (define-key python-mode-map "$" 'electric-pair)
;; 	    ))


;; (add-hook 'python-mode-hook
;;               (lambda ()
;;                 (define-key python-mode-map "(" 'electric-pair)
;;                 (define-key python-mode-map "[" 'electric-pair)
;;                 (define-key python-mode-map "{" 'electric-pair)
;; 		(define-key python-mode-map "'" 'electric-pair)))


;; * C++

(add-hook 'c++-mode-hook 'linum-mode)
(add-hook 'c-mode-hook 'linum-mode)

;; ; start auto-complete with emacs
;; (require 'auto-complete)
;; ; do default config for auto-complete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; ; start yasnippet with emacs
;; (require 'yasnippet)
;; (yas-global-mode 1)
;; ; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
;; (defun my:ac-c-header-init ()
;;   (require 'auto-complete-c-headers)
;;   (add-to-list 'ac-sources 'ac-source-c-headers)
;;   ;; (add-to-list 'achead:include-directories '"/usr/local/Cellar/llvm/7.0.0/include/clang/7.0.0/include")
;; (add-to-list 'achead:include-directories '"/Library/Developer/CommandLineTools/usr/lib/clang/10.0.0/include")
;; )
;; ; now let's call this function from c/c++ hooks
;; (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;; (add-hook 'c-mode-hook 'my:ac-c-header-init)

;; ; Fix iedit bug in Mac
;; (define-key global-map (kbd "C-c ;") 'iedit-mode)

;; ; start flymake-google-cpplint-load
;; ; let's define a function for flymake initialization
;; (defun my:flymake-google-init ()
;;   (require 'flymake-google-cpplint)
;;   (custom-set-variables
;;    '(flymake-google-cpplint-command "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/cpplint"))
;;   (flymake-google-cpplint-load)
;; )
;; (add-hook 'c-mode-hook 'my:flymake-google-init)
;; (add-hook 'c++-mode-hook 'my:flymake-google-init)

;; ; start google-c-style with emacs
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; ;; ** Company

;; (require 'company)
;; (add-hook 'c++-mode-hook 'global-company-mode)

;; ;; ** Irony

;; ; set LD_LIBRARY_PATH
;; ;; (setenv "LD_LIBRARY_PATH" "/usr/local/Cellar/llvm/7.0.0/lib/")
;; (setenv "LD_LIBRARY_PATH" "/Library/Developer/CommandLineTools/usr/lib/")
;; ; load irony-mode
;; ;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/irony-mode/elisp/"))
;; (require 'irony)
;; ;; ; also enable ac plugin
;; ;; (irony-enable 'ac)
;; ; define a function to start irony mode for c/c++ modes
;; (defun my:irony-enable()
;;   (when (member major-mode irony-known-modes)
;;     (irony-mode 1)))
;; (add-hook 'c++-mode-hook 'my:irony-enable)
;; (add-hook 'c-mode-hook 'my:irony-enable)
;; (add-hook 'c++-mode-hook 'irony-mode)
;; (add-hook 'c-mode-hook 'irony-mode)
;; (add-hook 'objc-mode-hook 'irony-mode)

;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; (eval-after-load 'company
;;   '(add-to-list 'company-backends 'company-irony))


;; ;; (req-package company
;; ;;   :config
;; (progn
;;   (add-hook 'after-init-hook 'global-company-mode)
;;   (global-set-key (kbd "M-/") 'company-complete-common-or-cycle)
;;   (setq company-idle-delay 0))
;; ;; )

;; ;; (req-package irony
;; ;;   :config
;; (progn
;;   ;; If irony server was never installed, install it.
;;   (unless (irony--find-server-executable) (call-interactively #'irony-install-server)
;; ;; )

;;     ;; Use compilation database first, clang_complete as fallback.
;;     (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
;;                                                       irony-cdb-clang-complete))

;;     (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
;;   ))

;; ;;   ;; I use irony with company to get code completion.
;; ;;   (req-package company-irony
;; ;;     :require company irony
;; ;;     :config
;; (require 'company-irony)
;; (progn
;;   (eval-after-load 'company '(add-to-list 'company-backends 'company-irony)))
;; ;; )

;; ;;   ;; I use irony with flycheck to get real-time syntax checking.
;; ;;   (req-package flycheck-irony
;; ;;     :require flycheck irony
;; ;;     :config
;; (require 'flycheck-irony)
;; (progn
;;   (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup)))
;; ;; )

;; ;;   ;; Eldoc shows argument list of the function you are currently writing in the echo area.
;; ;;   (req-package irony-eldoc
;; ;;     :require eldoc irony
;; ;;     :config
;; (require 'irony-eldoc)
;; (progn
;;   (add-hook 'irony-mode-hook #'irony-eldoc))
;; ;; )


;; ;; ** RTAGS

;; (require 'rtags)
;; (unless (rtags-executable-find "rc") (error "Binary rc is not installed!"))
;; (unless (rtags-executable-find "rdm") (error "Binary rdm is not installed!"))

;; (add-hook 'c-mode-hook 'rtags-start-process-unless-running)
;; (add-hook 'c++-mode-hook 'rtags-start-process-unless-running)
;; (add-hook 'objc-mode-hook 'rtags-start-process-unless-running)

;; (define-key c-mode-base-map (kbd "M-.") 'rtags-find-symbol-at-point)
;; (define-key c-mode-base-map (kbd "M-,") 'rtags-find-references-at-point)
;; (define-key c-mode-base-map (kbd "M-?") 'rtags-display-summary)
;; (rtags-enable-standard-keybindings)

;; (setq rtags-use-helm t)

;; ;; Shutdown rdm when leaving emacs.
;; (add-hook 'kill-emacs-hook 'rtags-quit-rdm)

;; ;; TODO: Has no coloring! How can I get coloring?
;; (require 'helm-tags)
;; (progn
;;   (setq rtags-display-result-backend 'helm)
;;   )

;; ;; Use rtags for auto-completion.

;; (progn
;;   (setq rtags-autostart-diagnostics t)
;;   (rtags-diagnostics)
;;   (setq rtags-completions-enabled t)
;;   (push 'company-rtags company-backends)
;;   )

;; ;; Live code checking.
;; (require 'flycheck-rtags)
;; (progn
;;   ;; ensure that we use only rtags checking
;;   ;; https://github.com/Andersbakken/rtags#optional-1
;;   (defun setup-flycheck-rtags ()
;;     (flycheck-select-checker 'rtags)
;;     (setq-local flycheck-highlighting-mode nil) ;; RTags creates more accurate overlays.
;;     (setq-local flycheck-check-syntax-automatically nil)
;;     (rtags-set-periodic-reparse-timeout 2.0)  ;; Run flycheck 2 seconds after being idle.
;;     )
;;   (add-hook 'c-mode-hook #'setup-flycheck-rtags)
;;   (add-hook 'c++-mode-hook #'setup-flycheck-rtags)
;;   )


;; CQUERY

(require 'cquery)
(setq cquery-executable "/usr/local/Cellar/cquery/20180718/bin/cquery")

;; LSP MODE

(require 'lsp-mode)

(lsp-define-stdio-client
 ;; This can be a symbol of your choosing. It will be used as a the
 ;; prefix for a dynamically generated function "-enable"; in this
 ;; case: lsp-prog-major-mode-enable
 lsp-prog-major-mode
 "language-id"
 ;; This will be used to report a project's root directory to the LSP
 ;; server.
 (lambda () default-directory)
 ;; This is the command to start the LSP server. It may either be a
 ;; string containing the path of the command, or a list wherein the
 ;; car is a string containing the path of the command, and the cdr
 ;; are arguments to that command.
 '("/my/lsp/server" "and" "args"))

;; Here we'll add the function that was dynamically generated by the
;; call to lsp-define-stdio-client to the major-mode hook of the
;; language we want to run it under.
;;
;; This function will turn lsp-mode on and call the command given to
;; start the LSP server.
(add-hook 'prog-major-mode #'lsp-prog-major-mode-enable)


;; SMERGE
(setq smerge-command-prefix (kbd "C-c ç"))
;; (setq smerge-command-prefix "\C-c '")
