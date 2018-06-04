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
 '(org-agenda-files
   (quote
    ("/home/daniel/Master/DIVP/notes_DIVP.org")))
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
 '(package-selected-packages
   (quote
    (pdf-tools multiple-cursors org-bullets org-dashboard org-gcal org-grep org-tree-slide org-wc org-wunderlist irfc ample-theme flycheck flymd markdown-mode markdown-mode+ markdown-preview-mode org-ac undo-tree yasnippet))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; AMPLE THEME

;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
(load-theme 'ample t t)
;; (load-theme 'ample-flat t t)
;; (load-theme 'ample-light t t)
;; choose one to enable
(enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)

;; ORG MODE

(setq org-hide-emphasis-markers t)

;; (org-startup-with-inline-images .)

(with-eval-after-load 'org
  (modify-syntax-entry ?/ "(/" org-mode-syntax-table)
  (modify-syntax-entry ?* "(*" org-mode-syntax-table)
  (modify-syntax-entry ?_ "(_" org-mode-syntax-table)
  (modify-syntax-entry ?= "(=" org-mode-syntax-table)
  )

;; (add-to-list 'org-emphasis-alist
;;              '("=" (:foreground "DimGrey")
;;                ))

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(add-hook 'org-mode-hook 'turn-on-flyspell)
(add-hook 'org-mode-hook 'flyspell-mode) ;start flyspell-mode
(setq ispell-dictionary "en")    ;set the default dictionary

;(require 'org-latex)
(require 'ox-latex)
(setq org-latex-packages-alist 
      (quote (("" "color" t) ("" "minted" t) ("" "parskip" t)))
      org-latex-pdf-process 
      (quote (
	      "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f" 
	      "bibtex $(basename %b)" 
	      "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f" 
	      "pdflatex -interaction nonstopmode -shell-escape -output-directory %o %f")))
(with-eval-after-load 'ox-latex
  (add-to-list 'org-latex-classes
	       `("paper"
		 "\\documentclass{article}
               %[NO-DEFAULT-PACKAGES]
\\usepackage{spconf}
               %[PACKAGES]
               %[EXTRA]
\\name{Daniel Moreno Manzano \\thanks{}}"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" "\\newpage" "\\subsection*{%s}" "\\newpage")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	       `("code"
		 "\\documentclass{article}
               %[NO-DEFAULT-PACKAGES]
               %[PACKAGES]
               %[EXTRA]"))
  ;; ("\\section{%s}" . "\\section*{%s}")
  ;; ("\\subsection{%s}" "\\newpage" "\\subsection*{%s}" "\\newpage")
  ;; ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ;; ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ;; ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
)

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("ta" "#+TITLE: ?
#+AUTHOR: Daniel Moreno Manzano

* " ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("cheat" "#+TITLE: ?
#+AUTHOR: Daniel Moreno Manzano
#+OPTIONS: texht:t toc:nil todo:nil tasks:nil tags:nil <:nil
#+LATEX_CLASS: article
#+LATEX_CLASS_OPTIONS:
#+LATEX_HEADER: \\usepackage{multicol} \\usepackage{calc} \\usepackage{ifthen} \\usepackage[landscape]{geometry} \\usepackage{amsmath,amsthm,amsfonts,amssymb} \\usepackage{color,graphicx,overpic}
#+LATEX_HEADER: % This sets page margins to .5 inch if using letter paper, and to 1cm
#+LATEX_HEADER: % if using A4 paper. (This probably isn't strictly necessary.)
#+LATEX_HEADER: % If using another size paper, use default 1cm margins.
#+LATEX_HEADER: \\ifthenelse{\\lengthtest { \\paperwidth = 11in}}
#+LATEX_HEADER:     { \\geometry{top=.5in,left=.5in,right=.5in,bottom=.5in} }
#+LATEX_HEADER:     {\\ifthenelse{ \\lengthtest{ \\paperwidth = 297mm}}
#+LATEX_HEADER:         {\\geometry{top=1cm,left=1cm,right=1cm,bottom=1cm} }
#+LATEX_HEADER:         {\\geometry{top=1cm,left=1cm,right=1cm,bottom=1cm} }
#+LATEX_HEADER:     }
#+LATEX_HEADER: 
#+LATEX_HEADER: % Turn off header and footer
#+LATEX_HEADER: \\pagestyle{empty}
#+LATEX_HEADER: 
#+LATEX_HEADER: % Redefine section commands to use less space
#+LATEX_HEADER: \\makeatletter
#+LATEX_HEADER: \\renewcommand{\\section}{\\@startsection{section}{1}{0mm}%
#+LATEX_HEADER:                                 {-1ex plus -.5ex minus -.2ex}%
#+LATEX_HEADER:                                 {0.5ex plus .2ex}%x
#+LATEX_HEADER:                                 {\\normalfont\\large\\bfseries}}
#+LATEX_HEADER: \\renewcommand{\\subsection}{\\@startsection{subsection}{2}{0mm}%
#+LATEX_HEADER:                                 {-1explus -.5ex minus -.2ex}%
#+LATEX_HEADER:                                 {0.5ex plus .2ex}%
#+LATEX_HEADER:                                 {\\normalfont\\normalsize\\bfseries}}
#+LATEX_HEADER: \\renewcommand{\\subsubsection}{\\@startsection{subsubsection}{3}{0mm}%
#+LATEX_HEADER:                                 {-1ex plus -.5ex minus -.2ex}%
#+LATEX_HEADER:                                 {1ex plus .2ex}%
#+LATEX_HEADER:                                 {\\normalfont\\small\\bfseries}}
#+LATEX_HEADER: \\makeatother
#+LATEX_HEADER: 
#+LATEX_HEADER: % Define BibTeX command
#+LATEX_HEADER: \\def\\BibTeX{{\\rm B\\kern-.05em{\\sc i\\kern-.025em b}\\kern-.08em
#+LATEX_HEADER:     T\\kern-.1667em\\lower.7ex\\hbox{E}\\kern-.125emX}}
#+LATEX_HEADER: 
#+LATEX_HEADER: % Don't print section numbers
#+LATEX_HEADER: \\setcounter{secnumdepth}{0}
#+LATEX_HEADER: 
#+LATEX_HEADER: 
#+LATEX_HEADER: \\setlength{\\parindent}{0pt}
#+LATEX_HEADER: \\setlength{\\parskip}{0pt plus 0.5ex}
#+LATEX_HEADER: 
#+LATEX_HEADER: %My Environments
#+LATEX_HEADER: \\newtheorem{example}[section]{Example}
#+LATEX_HEADER: % -----------------------------------------------------------------------

#+LaTeX: \\begin{multicols}{3}

* 

#+LaTeX: \\end{multicols}" ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("pdf" "#+INTERLEAVE_PDF: /scp:daniel@koiserver.ddns.net:~/?" ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("mpdf" ":PROPERTIES:
:INTERLEAVE_PDF: /scp:daniel@koiserver.ddns.net:~/?
:END:" ""))))


;; ORG-BABEL

(with-eval-after-load 'org
  (require 'ob-python)
  (require 'ob-ipython)
  ;; (require 'ob-clojure)
  ;; (require 'ob-perl)
  ;; (require 'ob-dot)
  (require 'ob-R)
  ;; (require 'ob-gnuplot)
  ;; (require 'ob-lisp)
  ;; (require 'ob-org)
  ;; (require 'ob-screen)
  ;; (require 'ob-calc)
  ;; (require 'ob-js)
  ;; (require 'ob-latex)
  ;; (require 'ob-plantuml)
  ;; (require 'ob-sh)
  (require 'ob-ditaa)
  ;; (require 'ob-awk)
  ;; (require 'ob-octave)
  ;; (require 'ob-sed)
  ;; (require 'ob-sql)
  ;; (require 'ob-sqlite)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((C . t)
     ;; (perl . t)
     ;; (dot . t)
     (R . t)
     ;; (gnuplot . t)
     ;; (clojure . t)
     ;; (graphviz . t)
     ;; (lisp . t)
     ;; (stan . t)
     ;; (org . t)
     ;; (screen . t)
     ;; (calc . t)
     ;; (js . t)
     ;; (latex . t)
     ;; (plantuml . t)
     ;; (ruby . t)
     (sh . t)
     (python . t)
     (ipython . t)
     ;; (emacs-lisp . t)
     (ditaa . t)
     ;; (awk . t)
     ;; (octave . t)
     ;; (sed . t)
     ;; (sql . t)
     ;; (sqlite . t)
     ))
  )


;; TRAMP

(require 'tramp)
(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(setq tramp-default-method "ssh")
; Backup (file~) disabled and auto-save (#file#) locally to prevent delays in editing remote files
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))
(setq tramp-auto-save-directory temporary-file-directory)
(setq tramp-verbose 10)

;; MULTIPLE CURSORS

(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; LANGTOOL

(require 'langtool)
(setq langtool-language-tool-jar "~/.emacs.d/LanguageTool-3.6/languagetool-commandline.jar")

(setq langtool-mother-tongue "es")
;; (setq langtool-default-language "en-US")

;; (global-set-key "\C-x4w" 'langtool-check)
;; (global-set-key "\C-x4W" 'langtool-check-done)
;; (global-set-key "\C-x4l" 'langtool-switch-default-language)
;; (global-set-key "\C-x44" 'langtool-show-message-at-point)
;; (global-set-key "\C-x4c" 'langtool-correct-buffer)

;; HELM

(require 'helm-config)

;; GCAL

;; (require 'org-gcal)
;; (setq org-gcal-client-id "1037161849993-8qfn4b5gds7e8crtr6nt8mr2o3m7ehiq.apps.googleusercontent.com"
;;       org-gcal-client-secret "BipL7H7Wl_zWYT3vjjYJqnpC"
;;       org-gcal-file-alist '(("l36qmkaau3a2pq3jjuvierjrfc@group.calendar.google.com" .  "~/Documents/agenda.org")))

;; ESS

(require 'ess-site)

;; TREE SLIDE

(require 'org-tree-slide)

;; ORG BEAUTIFY THEME

(when window-system (require 'org-beautify-theme))

;; ORG REF

(require 'org-ref)

;; ;; ALERT

;; (require 'alert)
;; (require 'org-alert)
;; (setq alert-default-style 'libnotify)

;; ORG MOBILE

(setq org-directory "/home")
(setq org-mobile-directory "/daniel@koiserver.ddns.net:~/ORGmobile")
(setq org-mobile-inbox-for-pull (concat org-directory "/index.org"))

;; PDF TOOLS

(pdf-tools-install)


(provide '.emacs)
;;; .emacs ends here
