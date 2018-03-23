;;; package --- Summary

;;; Commentary:


;;; Code:

;; MELPA PACKAGES

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
 '(inhibit-startup-screen t)
 '(org-agenda-files
   (quote
    ("/ssh:daniel@koiserver.ddns.net:/home/daniel/Master/Quantum_Computing_and_Quantum_Information/title_abstract_thesis.org")))
 '(package-selected-packages
   (quote
    (pungi jedi ob-ipython calfw-org org-super-agenda org-context pos-tip vlf ess ess-R-object-popup ess-view ac-ispell helm-ispell langtool helm-orgcard ob-diagrams ob-spice ob-translate org-agenda-property org-alert org-autolist org-beautify-theme org-pdfview helm helm-bibtex interleave org-capture-pop-frame org-ref pdf-tools multiple-cursors org-bullets org-dashboard org-gcal org-grep org-tree-slide org-wc org-wunderlist irfc ample-theme flycheck flymd markdown-mode markdown-mode+ markdown-preview-mode org-ac undo-tree yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ;; UNCAPITALIZED REGION

;; (put 'downcase-region 'disabled t)

;; TECLADO MAC OS

(when (eq system-type 'darwin)
  (setq mac-right-option-modifier 'none))


;; (setq default-input-method "MacOSX")

;; (setq mac-option-modifier nil
;;       mac-command-modifier 'meta
;;       x-select-enable-clipboard t)

;; THEME

(load-file "my_emacs_conf/theme.el")

;; UNDO TREE

(global-undo-tree-mode)
(setq undo-tree-auto-save-history t)

;; LANGUAGE CORRECTORS

(load-file "my_emacs_conf/lang_correct.el")

;; ORG MODE

(load-file "my_emacs_conf/org_mode.el")

;; TRAMP

(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(setq tramp-default-method "ssh")
; backup (file~) disabled and auto-save (#file#) locally to prevent delays in editing remote files
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory temporary-file-directory)
(setq tramp-verbose 10)

(let ((default-directory "/ssh:daniel@koiserver.ddns.net:"))
  (start-file-process "grep" (get-buffer-create "*grep*")
                      "/bin/sh" "-c" "grep -e tramp *"))

;; VIEW LARGE FILES (VLF)

(require 'vlf-setup)

;; MULTIPLE CURSORS

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;; PROGRAMMING

(load-file "my_emacs_conf/programming.el")

;; HELM

(require 'helm)
(require 'helm-config)

;; CALENDAR

(load-file "my_emacs_conf/calendar.el")

(provide '.emacs)
;;; .emacs ends here
