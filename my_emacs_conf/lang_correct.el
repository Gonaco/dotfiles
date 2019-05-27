;; ISPELL

(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.6.1/bin/aspell")

;; (setq ispell-program-name (executable-find "hunspell"))
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
;; (global-set-key "\C-x4w" 'langtool-check-done)
(global-set-key "\C-x4l" 'langtool-switch-default-language)
;; (global-set-key "\C-x44" 'langtool-show-message-at-point)
;; (global-set-key "\C-x4c" 'langtool-correct-buffer)

;; ;; SYNOSAURUS

;; (require 'synosaurus)
;; (exec-path-from-shell-initialize)
;; (add-hook 'text-mode-hook (lambda () (synosaurus-mode)))

;; (setq synosaurus-choose-method "popup")

;; (setq synosaurus-backend 'synosaurus-backend-wordnet)
;; (setq synosaurus-choose-method 'popup)

;; ;; WWW-SYNONIMS
;; (require 'www-synonyms)

;; ;; get key here: http://thesaurus.altervista.org/mykey
;; (setq www-synonyms-key "vVEyvJHoZB0rruiyqNB0")

;; ;; any of: it, fr, de, en, el, es, no, pt, ro, ru, sk
;; (www-synonyms-change-lang "english (gr)")

;; WORDNUT

(require 'wordnut)
(exec-path-from-shell-initialize)
;; (global-set-key (kbd "") 'wordnut-search)
(global-set-key  (kbd "<C-s-268632084>") 'wordnut-lookup-current-word)

;; ;; ARTBOLLOCKS

;; (require 'artbollocks-mode)
;; ;; Avoid these phrases
;; (setq weasel-words-regex
;;       (concat "\\b" (regexp-opt
;;                      '("one of the"
;;                        "should"
;;                        "just"
;;                        "sort of"
;;                        "a lot"
;;                        "probably"
;;                        "maybe"
;;                        "perhaps"
;;                        "I think"
;;                        "really"
;;                        "pretty"
;;                        "maybe"
;;                        "nice"
;;                        "action"
;;                        "utilize"
;;                        "leverage") t) "\\b"))
;; ;; Fix a bug in the regular expression to catch repeated words
;; (setq lexical-illusions-regex "\\b\\(\\w+\\)\\W+\\(\\1\\)\\b")
;; ;; Don't show the art critic words, or at least until I figure
;; ;; out my own jargon
;; (setq artbollocks nil)
;; ;; Make sure keywords are case-insensitive
;; (defadvice search-for-keyword (around sacha activate)
;;   "Match in a case-insensitive way."
;;   (let ((case-fold-search t))
;;     ad-do-it))
