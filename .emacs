;;; package --- Summary

;;; Commentary:


;;; Code:

;; ;; * DETAILED ERRORS

;; (setq debug-on-error t)

;; * MELPA PACKAGES

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-auto-complete-chars (quote (32 95 40 41 119 46 34 36 39 60 62 47 124 33)))
 '(darkroom-text-scale-increase 1)
 '(darkroom-verbose t)
 '(ess-R-font-lock-keywords
   (quote
    ((ess-R-fl-keyword:modifiers . t)
     (ess-R-fl-keyword:fun-defs . t)
     (ess-R-fl-keyword:keywords . t)
     (ess-R-fl-keyword:assign-ops . t)
     (ess-R-fl-keyword:constants . t)
     (ess-fl-keyword:fun-calls . t)
     (ess-fl-keyword:numbers . t)
     (ess-fl-keyword:operators . t)
     (ess-fl-keyword:delimiters . t)
     (ess-fl-keyword:= . t)
     (ess-R-fl-keyword:F&T . t)
     (ess-R-fl-keyword:%op% . t))))
 '(gnus-use-full-window t)
 '(inhibit-startup-screen t)
 '(ns-use-fullscreen-animation t)
 '(org-ac/ac-trigger-command-keys (quote ("\\" "*" "+")))
 '(org-agenda-files
   (quote
    ("/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/mapping_paper.org" "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/agenda.org" "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/Quantum.org" "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/buscar_trabajo.org" "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/music.org"  "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/malnascudes.org")))
 '(package-selected-packages
   (quote
    (mu4e-alert org-randomnote ox-clip helm-bibtexkey company-lsp cquery lsp-clangd lsp-mode ac-rtags company-rtags flycheck-rtags helm-rtags el-autoyas haskell-snippets java-snippets org-sync-snippets r-autoyas yankpad yasnippet-snippets flymake-google-cpplint google-c-style c-eldoc irony-eldoc flycheck-irony org-wild-notifier calfw wordnut artbollocks-mode org-plus-contrib pdf-tools org-download flycheck-demjsonlint flymake-json tiny outshine outorg rtags comment-dwim-2 dtrt-indent clean-aindent-mode helm-projectile zygospore projectile use-package anzu helm-gtags iedit volatile-highlights ws-butler company company-bibtex company-irony company-irony-c-headers company-math irony ace-window which-key xah-fly-keys xahk-mode navi-mode evil oauth2 org-caldav bison-mode helm-ag helm-swoop smex floobits rudel magit fountain-mode darkroom sublimity writegood-mode writeroom-mode xkcd www-synonyms synonymous synosaurus sr-speedbar exec-path-from-shell pyenv-mode jedi-direx pungi jedi ob-ipython calfw-org org-super-agenda org-context pos-tip vlf ess ess-R-object-popup ess-view ac-ispell helm-ispell langtool helm-orgcard ob-diagrams ob-spice ob-translate org-agenda-property org-alert org-beautify-theme org-pdfview interleave org-capture-pop-frame multiple-cursors org-dashboard org-gcal org-grep org-tree-slide org-wc org-wunderlist irfc ample-theme flycheck flymd markdown-mode markdown-mode+ markdown-preview-mode org-ac undo-tree yasnippet)))
 '(safe-local-variable-values
   (quote
    ((pyvenv-activate "/home/daniel/anaconda3/envs/qpy/")
     (exec-path-from-shell-copy-env "/home/daniel/anaconda3/envs/qpy")
     (exec-path-from-shell-initialize)
     (pyvenv-activate "/ssh:daniel@koiserver.ddns.net:/home/daniel/anaconda3/envs/qpy/"))))
 '(send-mail-function (quote sendmail-send-it))
 '(show-paren-mode t)
 '(synosaurus-backend (quote synosaurus-backend-wordnet))
 '(synosaurus-prefix ""))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ;; * LOAD BIN FILES

;; (when (memq window-system '(mac os x))
;;    (exec-path-from-shell-initialize))

;; ;; * FULL SCREEN

;; (add-to-list 'default-frame-alist '(fullscreen . maximized))

;; ;; * UNCAPITALIZED REGION

;; (put 'downcase-region 'disabled t)

;; * TECLADO MAC OS

(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))


; (setq default-input-method "MacOSX")

; (setq mac-option-modifier nil
;       mac-command-modifier 'meta
;       x-select-enable-clipboard t)

;; ;; * XAH FLY KEYS

;; (require 'xah-fly-keys)

;; (xah-fly-keys-set-layout "qwerty") ; required if you use qwerty

;; ;; for other layout, use one of
;; ;; "workman"
;; ;; "qwertz"
;; ;; "programer-dvorak"
;; ;; "dvorak"
;; ;; "colemak"
;; ;; "colemak-mod-dh"
;; ;; dvorak is the default

;; (xah-fly-keys 1)

;; WHICH-KEY

(which-key-setup-side-window-bottom)

;; * SAVE EMACS SESSIONS

;; (desktop-save-mode 1)

;; * THEME

(load-file "~/my_emacs_conf/theme.el")

;; * LANGUAGE CORRECTORS

(load-file "~/my_emacs_conf/lang_correct.el")

;; * ORG MODE

(load-file "~/my_emacs_conf/org_mode.el")

;; ;; * TRAMP

;; (require 'tramp)
;; (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
;; (setq tramp-default-method "ssh")
;; ; backup (file~) disabled and auto-save (#file#) locally to prevent delays in editing remote files
;; (add-to-list 'backup-directory-alist
;;              (cons tramp-file-name-regexp nil))
;; (setq tramp-auto-save-directory temporary-file-directory)
;; (setq tramp-verbose 10)

;; (let ((default-directory "/ssh:daniel@koiserver.ddns.net:"))
;;   (start-file-process "grep" (get-buffer-create "*grep*")
;;                       "/bin/sh" "-c" "grep -e tramp *"))

;; * VIEW LARGE FILES (VLF)

(require 'vlf-setup)

;; * MULTIPLE CURSORS

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; ;; * XAH FLY

;; (require 'xah-fly-keys)

;; (xah-fly-keys-set-layout "qwerty") ; required if you use qwerty

;; * PROGRAMMING

(load-file "~/my_emacs_conf/programming.el")

;; * HELM

(require 'helm)
(require 'helm-config)

;; ** swoop
(require 'helm-swoop)

;; ***  Change the keybinds to whatever you like :)
;; (global-set-key (kbd "M-i") 'helm-swoop)
;; (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
;; (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "s-f") 'helm-multi-swoop-all)

;; ***  When doing isearch, hand the word over to helm-swoop
(define-key isearch-mode-map (kbd "s-f") 'helm-swoop-from-isearch)
;; ***  From helm-swoop to helm-multi-swoop-all
(define-key helm-swoop-map (kbd "s-f") 'helm-multi-swoop-all-from-helm-swoop)

;; ***  When doing evil-search, hand the word over to helm-swoop
;; (define-key evil-motion-state-map (kbd "M-i") 'helm-swoop-from-evil-search)

;; ;; ***  Instead of helm-multi-swoop-all, you can also use helm-multi-swoop-current-mode
;; (define-key helm-swoop-map (kbd "M-m") 'helm-multi-swoop-current-mode-from-helm-swoop)

;; ;; ***  Move up and down like isearch
;; (define-key helm-swoop-map (kbd "C-r") 'helm-previous-line)
;; (define-key helm-swoop-map (kbd "C-s") 'helm-next-line)
;; (define-key helm-multi-swoop-map (kbd "C-r") 'helm-previous-line)
;; (define-key helm-multi-swoop-map (kbd "C-s") 'helm-next-line)

;; ;; ***  Save buffer when helm-multi-swoop-edit complete
;; (setq helm-multi-swoop-edit-save t)

;; ;; ***  If this value is t, split window inside the current window
;; (setq helm-swoop-split-with-multiple-windows nil)

;; ;; ***  Split direcion. 'split-window-vertically or 'split-window-horizontally
;; (setq helm-swoop-split-direction 'split-window-vertically)

;; ;; ***  If nil, you can slightly boost invoke speed in exchange for text color
;; (setq helm-swoop-speed-or-color nil)

;; ;; ;; ***  Go to the opposite side of line from the end or beginning of line
;; (setq helm-swoop-move-to-line-cycle t)

;; ;; ***  Optional face for line numbers
;; ;; Face name is `helm-swoop-line-number-face`
;; (setq helm-swoop-use-line-number-face t)

;; ;; ***  If you prefer fuzzy matching
;; (setq helm-swoop-use-fuzzy-match t)

;; ;; ***  If you would like to use migemo, enable helm's migemo feature
;; (helm-migemo-mode 1)


;; * UNDO TREE

(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)

;; * SPEEDBAR

(require 'sr-speedbar)
;; (sr-speedbar-open)
(global-set-key (kbd "C-x M-f") 'sr-speedbar-open)
(global-set-key (kbd "<f9>") 'sr-speedbar-toggle)

;; * DIRED

(setq wdired-allow-to-change-permissions t)
(add-to-list 'load-path "~/.emacs.d/dired-sort")
(require 'dired-sort)

;; * IDO MODE

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; * SMEX

(require 'smex)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; * ACE WINDOW

(global-set-key (kbd "M-o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(defvar aw-dispatch-alist
  '((?x aw-delete-window "Delete Window")
	(?m aw-swap-window "Swap Windows")
	(?M aw-move-window "Move Window")
	(?j aw-switch-buffer-in-window "Select Buffer")
	(?n aw-flip-window)
	(?u aw-switch-buffer-other-window "Switch Buffer Other Window")
	(?c aw-split-window-fair "Split Fair Window")
	(?v aw-split-window-vert "Split Vert Window")
	(?b aw-split-window-horz "Split Horz Window")
	(?o delete-other-windows "Delete Other Windows")
	(?? aw-show-dispatch-help))
  "List of actions for `aw-dispatch-default'.")

;; * EDIFF

(if (locate-library "ediff")
    (progn
      (autoload 'ediff-files "ediff")
      (autoload 'ediff-buffers "ediff")

       (eval-after-load "ediff" '(progn
              (message "doing ediff customisation")
              (setq diff-switches               "-u"
                ediff-custom-diff-options   "-U3"
                ediff-split-window-function 'split-window-horizontally
                ediff-window-setup-function 'ediff-setup-windows-plain)

              (add-hook 'ediff-startup-hook 'ediff-toggle-wide-display)
              (add-hook 'ediff-cleanup-hook 'ediff-toggle-wide-display)
              (add-hook 'ediff-suspend-hook 'ediff-toggle-wide-display)))))

;; * CALENDAR

(load-file "~/my_emacs_conf/calendar.el")

;; ;; * SPLIT WINDOWS AT BEGINNING

;; (split-window-below)
;; (split-window-right)

;; * MAIL

(load-file "~/my_emacs_conf/mail.el")

(provide '.emacs)
;;; .emacs ends here
