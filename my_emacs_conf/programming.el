;; ESS

(require 'ess-site)


;; GIT

;; (add-hook 'kill-emacs-hook (shell-command "ssh daniel@koiserver.ddns.net; git add ~/documents/; git commit -m 'backup'; git stash; git pull -r ; git push; git stash apply &"))

;; PYTHON

(elpy-enable)

(pyvenv-activate "/anaconda3/envs/py3")

;; enable ipython
(elpy-use-ipython)

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
