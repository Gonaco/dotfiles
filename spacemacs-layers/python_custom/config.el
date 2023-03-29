;; This file configure the layer like declaring layer variables default values and setup some other variables related to the layer.

;; This file is loaded after funcs.el.


;; * PYENV

(setenv "WORKON_HOME" "/Users/daniel/opt/anaconda3/envs")
;; (pyvenv-mode 1)
;; After that choose the environment with M-x pyvenv-workon.

;; * DAP-MODE for python

;; ** Make it use the debugpy debugger
(setq dap-python-debugger 'debugpy)

