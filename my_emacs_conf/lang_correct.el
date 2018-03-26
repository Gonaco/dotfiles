;; ISPELL

(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.6.1/bin/aspell")

(setq ispell-program-name (executable-find "hunspell"))
(setq ispell-dictionary "en")
;; ispell-set-spellchecker-params has to be called
;; before ispell-hunspell-add-multi-dic will work
;; (ispell-set-spellchecker-params)
;; (ispell-hunspell-add-multi-dic "en,es")

;; enable remote directory configuration files
(setq enable-remote-dir-locals t)

;; LAGNTOOL

(require 'langtool)
;; (setq langtool-java-bin "/ssh:daniel@koiserver.ddns.net:/usr/lib/jvm/java-8-openjdk-amd64")
(setq langtool-language-tool-jar "~/.emacs.d/languagetool-4.0/languagetool-commandline.jar")

(setq langtool-mother-tongue "es")
(setq langtool-default-language "en-us")

(global-set-key "\C-x4w" 'langtool-check)
(global-set-key "\C-x4w" 'langtool-check-done)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
(global-set-key "\C-x44" 'langtool-show-message-at-point)
(global-set-key "\C-x4c" 'langtool-correct-buffer)
