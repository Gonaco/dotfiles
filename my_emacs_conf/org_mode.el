;; ORG MODE

(add-hook 'org-mode-hook 
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            ;; table
            (local-set-key "\C-\M-w" 'org-table-copy-region)
            (local-set-key "\C-\M-y" 'org-table-paste-rectangle)
            (local-set-key "\C-\M-l" 'org-table-sort-lines)
            ;; display images
            (local-set-key "\M-I" 'org-toggle-iimage-in-org)
            ;; fix tab
            (local-set-key "\C-y" 'yank)))

(setq org-hide-emphasis-markers t)

(with-eval-after-load 'org
  (modify-syntax-entry ?/ "(/" org-mode-syntax-table)
  (modify-syntax-entry ?* "(*" org-mode-syntax-table)
  (modify-syntax-entry ?_ "(_" org-mode-syntax-table)
  (modify-syntax-entry ?= "(=" org-mode-syntax-table)
  )

(setq org-latex-prefer-user-labels t)
;; (add-to-list 'org-emphasis-alist
;;              '("=" (:foreground "dimgrey")
;;                ))

;; TREE SLIDE

(require 'org-tree-slide)

;; ORG BEAUTIFY 

;; org beautify theme

(when window-system (require 'org-beautify-theme))

;; org bullets

(require 'org-bullets)
(with-eval-after-load 'org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode)))
  ;; (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  ;; (add-hook 'text-mode-hook 'org-bullets-mode)
)

(with-eval-after-load 'org
  ;; (add-hook 'org-mode-hook (lambda () (org-autolist-mode)))
  (add-hook 'org-mode-hook (lambda () (org-autolist-mode 1)))
  ;; (add-hook 'text-mode-hook 'org-autolist-mode)
)

;; LINE WRAP

(with-eval-after-load 'org       
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  )
;; (add-hook 'org-mode-hook (lambda () (visual-line-mode)))
;; (add-hook 'org-mode-hook (lambda () (visual-line-mode 1)))
(add-hook 'text-mode-hook 'visual-line-mode)

;; ORG CORRECTORS

;; (add-hook 'org-mode-hook (lambda () (turn-on-flyspell)))
;; (add-hook 'org-mode-hook (lambda () (turn-on-flyspell 1)))
;; (add-hook 'org-mode-hook (lambda () (flyspell-mode))) ;start flyspell-mode
;; (add-hook 'org-mode-hook (lambda () (flyspell-mode 1)))
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(setq ispell-dictionary "en")    ;set the default dictionary

;; ;; ARTBOLLOCKS

;; ;; (add-hook 'org-mode-hook (lambda () (artbollocks-mode)))
;; ;; (add-hook 'org-mode-hook (lambda () (artbollocks-mode 1)))
;; (add-hook 'text-mode-hook 'artbollocks-mode)
;; ;; (add-hook 'org-capture-mode-hook 'artbollocks-mode)


;; LATEX

(require 'ox-latex)
;; Compiling the latex properly
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
               %[no-default-packages]
\\usepackage{spconf}
\\usepackage{tabu}
\\usepackage{float}
\\usepackage{pdflscape}
               %[packages]
\\usepackage{booktabs}
\\usepackage{pstricks}
\\usepackage{pdftricks}
\\usepackage{pst-plot}
\\usepackage{pst-node}
\\usepackage{auto-pst-pdf}
               %[extra]
\\usemintedstyle{emacs}"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" "" "\\subsection*{%s}" "")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	       )
  (add-to-list 'org-latex-classes
	       `("assignment"
		 "\\documentclass[answers]{exam}
               %[no-default-packages]
\\usepackage{tabu}
\\usepackage{booktabs}
\\usepackage{float}
\\usepackage{pdflscape}
\\topmargin=-0.45in
\\evensidemargin=0in
\\oddsidemargin=0in
\\textwidth=6.5in
\\textheight=9.0in
\\headsep=0.25in
\\linespread{1.1}
               %[packages]
               %[extra]
\\usemintedstyle{emacs}"
  ("\\section{%s}\\begin{questions}" "\\end{questions} \\newpage" "\\section*{%s}" "\\end{questions} \\newpage")
  ("\\question{%s} \\begin{solution}" "\\end{solution}" "\\question*{%s} \\begin{solution}" "\\end{solution}"))
	       )
  (add-to-list 'org-latex-classes
	       `("code"
		 "\\documentclass{article}
               %[no-default-packages]
\\usepackage{tabu}
\\usepackage{booktabs}
\\usepackage{float}
\\usepackage{pdflscape}
               %[packages]
               %[extra]
\\usemintedstyle{emacs}"
  ("\\section{%s}" "" "\\section*{%s}" "")
  ("\\subsection{%s}" "\\newpage" "\\subsection*{%s}" "\\newpage")
  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
  ("\\paragraph{%s}" . "\\paragraph*{%s}")
  ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
	       )
  (add-to-list 'org-latex-classes
	       ;; beamer class, for presentations
	       '("beamer"
		 "\\documentclass\[11pt\]{beamer}\n
      \\usepackage{pgfpages}\n
      %\\setbeameroption{show notes}\n
      %\\setbeameroption{show notes on second screen=right}\n
      \\mode<presentation>\n
      \\usetheme{Madrid}\n
      %\\usecolortheme{{{{beamercolortheme}}}}\n
\\DefineNamedColor{named}{azul_quantum}{RGB}{19,149,206}
      %\\setbeamercolor{structure}{fg=cyan!50!black}
\\setbeamercolor{structure}{fg=azul_quantum}
      \\setbeamercolor*{block title example}{fg=cyan!50!black,bg=gray!10}
      \\setbeamertemplate{navigation symbols}{} % to remove the navigation symbols from the bottom of all slides uncomment this line
      \\AtBeginSection[]{

\\begin{frame}<beamer>
\\frametitle{Topic}
\\tableofcontents[currentsection]
\\end{frame}

        \\begin{frame}
        \\vfill
        \\centering
        \\begin{beamercolorbox}[sep=8pt,center,shadow=true,rounded=true]{title}
          \\usebeamerfont{title}\\insertsectionhead\\par%
        \\end{beamercolorbox}
        \\vfill
        \\end{frame}
      }
      \\beamertemplateballitem\n
      \\setbeameroption{show notes}
      \\usepackage{listings}
      \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
  frame=single,
  basicstyle=\\small,
  showspaces=false,showstringspaces=false,
  showtabs=false,
  keywordstyle=\\color{blue}\\bfseries,
  commentstyle=\\color{red},
  }\n
      \\institute\[\]{TU Delft QCA Lab}\n
       \\subject{Quantum Computing}\n

\\pgfdeclareimage[height=0.7cm]{logo}{logo}
\\logo{
	\\vspace*{-0.25cm}
	\\pgfuseimage{logo}
	\\hspace*{-0.05cm}}"

		 ("\\section{%s}" . "\\section*{%s}")
		 
		 ("\\begin{frame}\[fragile\]\\frametitle{%s}"
		  "\\end{frame}"
		  "\\begin{frame}\[fragile\]\\frametitle{%s}"
		  "\\end{frame}"))
	       )
  (add-to-list 'org-latex-classes
	       `("book"
		 "\\documentclass{book}
%[no-default-packages]
\\usepackage{tabu}
\\usepackage{booktabs}
\\usepackage{float}
\\usepackage{pdflscape}"
		 ;; ("\\part{%s}" . "\\part*{%s}")
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	       )
    (add-to-list 'org-latex-classes
	       `("tufte-book"
		 "\\documentclass{tufte-book}
%[no-default-packages]
\\usepackage{tabu}
\\usepackage{booktabs}
\\usepackage{float}
\\usepackage{pdflscape}"
		 ;; ("\\part{%s}" . "\\part*{%s}")
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	       )
  (add-to-list 'org-latex-classes
	       `("bookWsections"
		 "\\documentclass{book}
%[no-default-packages]
\\usepackage{tabu}
\\usepackage{booktabs}
\\usepackage{float}
\\usepackage{pdflscape}"
		 ("\\part{%s}" . "\\part*{%s}")
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	       )
    (add-to-list 'org-latex-classes
	       `("tufte-bookWsections"
		 "\\documentclass{tufte-book}
%[no-default-packages]
\\usepackage{tabu}
\\usepackage{booktabs}
\\usepackage{float}
\\usepackage{pdflscape}"
		 ("\\part{%s}" . "\\part*{%s}")
		 ("\\chapter{%s}" . "\\chapter*{%s}")
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
	       )
    (add-to-list 'org-latex-classes
		 `("tufte"
		   "\\documentclass{tufte-handout}
%[no-default-packages]
\\usepackage{tabu}
\\usepackage{booktabs}
\\usepackage{float}
\\usepackage{pdflscape}"
		   ("\\section{%s}" . "\\section*{%s}")
		   ("\\subsection{%s}" "" "\\subsection*{%s}" "")
		   ("\\allcaps{%s}" . "\\allcaps*{%s}")
		   ("\\paragraph{%s}" . "\\paragraph*{%s}")
		   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
		 )
    )


;; the first line adds reftex-citations with c-c (, the rest sets some reftex-defaults and adds a menu which allows you to chose using \textbackslash citep{} instead of \textbackslash cite{} (this is what acpd requires).

(require 'reftex-cite)
(defun org-mode-reftex-setup ()
  (interactive)
  (and (buffer-file-name) (file-exists-p (buffer-file-name))
       (progn
        ; reftex should use the org file as master file. see c-h v tex-master for infos.
        (setq tex-master t)
        (turn-on-reftex)
        ; enable auto-revert-mode to update reftex when bibtex file changes on disk
        (global-auto-revert-mode t) ; careful: this can kill the undo
                                    ; history when you change the file
                                    ; on-disk.
        (reftex-parse-all)
        ; add a custom reftex cite format to insert links
        ; this also changes any call to org-citation!
        (reftex-set-cite-format
         '((?c . "\\citet{%l}") ; natbib inline text
           (?i . "\\citep{%l}") ; natbib with parens
           ))))
  (define-key org-mode-map (kbd "\C-c )") 'reftex-citation)
  (define-key org-mode-map (kbd "\C-c (") 'org-mode-reftex-search))

(add-hook 'org-mode-hook 'org-mode-reftex-setup)

;; for nice sourcecode highlighting

(add-to-list 'org-latex-packages-alist '("" "minted"))
(add-to-list 'org-latex-packages-alist '("" "color"))
(setq org-latex-listings 'minted)
(setq org-latex-minted-options
           '(("frame" "lines")
             ("fontsize" "\\scriptsize")
             ("linenos" "")
	     ("breaklines" "")
	     ("breakanywhere" "")))

; add emacs lisp support for minted
(setq org-latex-custom-lang-environments
      '((emacs-lisp "common-lispcode")))



(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("ta" "#+TITLE: ?
#+AUTHOR: Daniel Moreno Manzano

* " ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("paper" "#+TITLE: ?
#+OPTIONS: toc:nil

#+LATEX_CLASS: paper
#+LATEX_CLASS_OPTIONS: 
#+LATEX_HEADER: 
#+LATEX_HEADER_EXTRA: [author]
#+LATEX_HEADER_EXTRA: \\name{Daniel Moreno Manzano}
#+LATEX_HEADER_EXTRA: \\address{daniel.moreno.manzano@alu-etsetb.upc.edu}
#+KEYWORDS: 
#+LATEX_compiler: pdflatex

#+BEGIN_abstract



#+END_abstract

* 


* BIB                                                                :ignore:

bibliography:
bibliographystyle:" ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("bib" "* BIB                                                                :ignore:

bibliography:
bibliographystyle:" ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("book" "#+TITLE: ?
#+AUTHOR: Daniel Moreno Manzano
#+OPTIONS: tags:nil

#+LATEX_CLASS: book

#+LATEX_HEADER: \\usepackage{float}
#+LATEX_HEADER: \\usepackage{tabu}
#+LATEX_HEADER: \\usepackage{fullpage}
#+LATEX_HEADER: \\usepackage{pdflscape}
#+LATEX_HEADER: \\usepackage{tikz} \\usetikzlibrary{mindmap,calc,trees,positioning,arrows,chains,shapes.geometric,decorations.pathreplacing,decorations.pathmorphing,shapes,matrix,shapes.symbols,plotmarks,decorations.markings,shadows}
#+LATEX_HEADER: \\usepackage{tikz-qtree}

** Preface/Abstract

* 

* BIB [delete this HEADER]

bibliography:
bibliographystyle:" ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("homework" "#+TITLE: ?
#+AUTHOR: Daniel Moreno Manzano
#+OPTIONS: H:2 texht:t toc:nil todo:nil tasks:nil tags:nil <:nil
#+LATEX_CLASS: assignment

* Section

** Question" ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("cheat" "#+TITLE: ?
#+AUTHOR: Daniel Moreno Manzano
#+OPTIONS: texht:t toc:nil todo:nil tasks:nil tags:nil <:nil
#+LATEX_CLASS: article
#+LATEX_CLASS_OPTIONS:
#+LATEX_HEADER: \\usepackage{multicol} \\usepackage{calc} \\usepackage{ifthen} \\usepackage[landscape]{geometry} \\usepackage{amsmath,amsthm,amsfonts,amssymb} \\usepackage{color,graphicx,overpic}
#+LATEX_HEADER: % this sets page margins to .5 inch if using letter paper, and to 1cm
#+LATEX_HEADER: % if using a4 paper. (this probably isn't strictly necessary.)
#+LATEX_HEADER: % if using another size paper, use default 1cm margins.
#+LATEX_HEADER: \\ifthenelse{\\lengthtest { \\paperwidth = 11in}}
#+LATEX_HEADER:     { \\geometry{top=.5in,left=.5in,right=.5in,bottom=.5in} }
#+LATEX_HEADER:     {\\ifthenelse{ \\lengthtest{ \\paperwidth = 297mm}}
#+LATEX_HEADER:         {\\geometry{top=1cm,left=1cm,right=1cm,bottom=1cm} }
#+LATEX_HEADER:         {\\geometry{top=1cm,left=1cm,right=1cm,bottom=1cm} }
#+LATEX_HEADER:     }
#+LATEX_HEADER: 
#+LATEX_HEADER: % turn off header and footer
#+LATEX_HEADER: \\pagestyle{empty}
#+LATEX_HEADER: 
#+LATEX_HEADER: % redefine section commands to use less space
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
#+LATEX_HEADER: % define bibtex command
#+LATEX_HEADER: \\def\\bibtex{{\\rm b\\kern-.05em{\\sc i\\kern-.025em b}\\kern-.08em
#+LATEX_HEADER:     t\\kern-.1667em\\lower.7ex\\hbox{e}\\kern-.125emx}}
#+LATEX_HEADER: 
#+LATEX_HEADER: % don't print section numbers
#+LATEX_HEADER: \\setcounter{secnumdepth}{0}
#+LATEX_HEADER: 
#+LATEX_HEADER: 
#+LATEX_HEADER: \\setlength{\\parindent}{0pt}
#+LATEX_HEADER: \\setlength{\\parskip}{0pt plus 0.5ex}
#+LATEX_HEADER: 
#+LATEX_HEADER: %my environments
#+LATEX_HEADER: \\newtheorem{example}[section]{example}
#+LATEX_HEADER: % -----------------------------------------------------------------------

#+LATEX: \\begin{multicols}{3}

* 

#+LATEX: \\end{multicols}" ""))))

(eval-after-load 'org
'(progn
   (add-to-list 'org-structure-template-alist
'("beamer" "#+TITLE: ?
#+AUTHOR: Daniel Moreno Manzano
#+OPTIONS: H:2 num:t toc:t \\n:nil @:t ::t |:t ^:t -:t f:t *:t <:t
#+OPTIONS:   TeX:t LaTeX:t skip:nil d:nil todo:t pri:nil tags:nil
#+startup: beamer
#+LATEX_CLASS: beamer
#+BEAMER_FRAME_LEVEL: 2
#+COLUMNS: %45ITEM %10BEAMER_ENV(Env) %10BEAMER_ACT(Act) %4BEAMER_COL(Col) %8BEAMER_OPT(Opt)

* Section

** Frame

*** Block 1                                        :B_block:BMCOL:
    :PROPERTIES:
    :BEAMER_COL: 0.48
    :BEAMER_ENV: block
    :END:

*** Block 2                                        :B_block:BMCOL:
    :PROPERTIES:
    :BEAMER_COL: 0.48
    :BEAMER_ACT: <2->
    :BEAMER_ENV: block
    :END:

**** Note                              :B_note:
     :PROPERTIES:
     :BEAMER_ENV: note
     :END:

" ""))))


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

(eval-after-load 'org
  '(progn
   (add-to-list 'org-structure-template-alist
		'("table" "#+caption: ?
#+NAME: tab:
#+ATTR_LATEX: :booktabs :environment :font \\tiny :width \\textwidth :float t :align |p{}|
#+TBLNAME: 

#+TBLFM: " ""))))

(eval-after-load 'org  
    '(progn
   (add-to-list 'org-structure-template-alist
		'("fig" "#+caption: ?
#+NAME: fig:
#+ATTR_LATEX: :width \\textwidth" ""))))

(eval-after-load 'org  
    '(progn
   (add-to-list 'org-structure-template-alist
		'("lfig" "#+BEGIN_EXPORT latex

\\begin{figure}
\\centering
?
\\caption{}
\\label{fig:}
\\end{figure}

#+END_EXPORT" ""))))

(eval-after-load 'org  
    '(progn
   (add-to-list 'org-structure-template-alist
		'("lmfig" "#+BEGIN_EXPORT latex

\\begin{figure}
\\centering
\\begin{minipage}{.45\\textwidth}
?
\\end{minipage}

\\begin{minipage}{.45\\textwidth}

\\end{minipage}

\\caption{}
\\label{fig:}
\\end{figure}

#+END_EXPORT" ""))))

(eval-after-load 'org  
    '(progn
   (add-to-list 'org-structure-template-alist
		'("lsfig" "#+BEGIN_EXPORT latex

\\begin{figure}
\\centering
\\subfigure[]{
?
\\label{fig:}
}

\\subfigure[]{

\\label{fig:}
}

\\caption{}
\\label{fig:}
\\end{figure}

#+END_EXPORT" ""))))

(eval-after-load 'org    
  '(progn
   (add-to-list 'org-structure-template-alist
		'("marginfig" "#+BEGIN_marginfigure

\\caption{?}
\\label{fig:}
#+END_marginfigure" ""))))

(eval-after-load 'org
  '(progn
     (add-to-list 'org-structure-template-alist
		'("tuftefig" "#+BEGIN_figure*

\\caption{?}
\\label{fig:}
#+END_figure*" ""))))

(eval-after-load 'org
  '(progn
     (add-to-list 'org-structure-template-alist
		'("abs" "#+BEGIN_abstract

?

#+END_abstract" ""))))

(eval-after-load 'org
  '(progn
     (add-to-list 'org-structure-template-alist
		  '("toc" "#+OPTIONS: toc:?" ""))))

(eval-after-load 'org
  '(progn
     (add-to-list 'org-structure-template-alist
		'("nomargin" "#+LATEX_HEADER: \\usepackage{geometry}
#+LATEX_HEADER: \\geometry{left=2.5cm,right=2.5cm,top=2.5cm,bottom=2.5cm}
?" ""))))

(eval-after-load 'org
  '(progn
     (add-to-list 'org-structure-template-alist
		'("thesisintro" "#+LATEX_CLASS: book
#+EXCLUDE_TAGS: noexport thesisnoexport
#+OPTIONS: tags:nil <:nil author:nil date:nil title:nil toc:nil
# num:nil
?" ""))))

(eval-after-load 'org
  '(progn
     (add-to-list 'org-structure-template-alist
		'("eq" "#+NAME: eq:?
\\begin{equation}

\\end{equation}" ""))))

;; ORG-BABEL

(with-eval-after-load 'org
  (require 'ob-python)
  ;; (require 'ob-ipython)
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
  (require 'ob-latex)
  ;; (require 'ob-plantuml)
  (require 'ob-shell)
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
     (latex . t)
     ;; (plantuml . t)
     ;; (ruby . t)
     (shell . t)
     (python . t)
     ;; (ipython . t)
     ;; (emacs-lisp . t)
     (ditaa . t)
     ;; (awk . t)
     ;; (octave . t)
     ;; (sed . t)
     ;; (sql . t)
     ;; (sqlite . t)
     ))
  )

;; \ONLY  IN BEAMER
(eval-after-load 'ox-beamer
  '(progn
     ;; only env for org-mode beamer
     (add-to-list 'org-beamer-environments-extra
		  '("onlyenv" "O" "\\begin{onlyenv}%a" "\\end{onlyenv}"))))


;; ORG REF

;; (setq org-ref-bibliography-notes "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Bibliography/notes.org"
;;       org-ref-default-bibliography '("~/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Bibliography/references.bib")
;;       org-ref-pdf-directory "~/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Bibliography/bibtex-pdfs/")

;; (unless (file-exists-p org-ref-pdf-directory)
;;   (make-directory org-ref-pdf-directory t))

;; open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
  (lambda (fpath)
    (start-process "open" "*open*" "open" fpath)))

;; alternative
(setq bibtex-completion-pdf-open-function 'org-ref-helm-cite)

(require 'org-ref)
(require 'org-ref-latex)
(require 'org-ref-pdf)
(require 'org-ref-url-utils)



;; PDF TOOLS

(pdf-tools-install)

;; IGNORE HEADLINES with tag "ignore"
(require 'ox-extra)
(ox-extras-activate '(ignore-headlines))

;; ;; TASKJUGGLER
;; (require 'ox-taskjuggler)


;; AUTO COMPLETE IN ORG (auto-complete-mode)

;; (add-hook 'org-mode-hook 'auto-complete-mode)
;; (add-to-list 'ac-modes 'org-mode)

;; (require 'org-ac)
;; ;; Make config suit for you. About the config item, eval the following sexp.
;; ;; (customize-group "org-ac")
;; (org-ac/config-default)

;; WRITING GOOD
(require 'writegood-mode)

;; (add-hook 'org-mode-hook (lambda () (writegood-mode)))
;; (add-hook 'org-mode-hook (lambda () (writegood-mode 1)))
(add-hook 'text-mode-hook 'writegood-mode)
(global-set-key "\C-cg" 'writegood-mode)

(global-set-key "\C-c\C-gg" 'writegood-grade-level)
(global-set-key "\C-c\C-ge" 'writegood-reading-ease)

;; NO DISTRACTIONS

;; darkroom
(require 'darkroom)

(with-eval-after-load 'org
  (global-set-key (kbd "<C-escape>") 'darkroom-tentative-mode)
  (global-set-key (kbd "<C-M-escape>") 'darkroom-mode))

;; (with-eval-after-load 'darkroom-tentative-mode
;;   ())

;; writeroom
(with-eval-after-load 'writeroom-mode
  (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
  (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
  (define-key writeroom-mode-map (kbd "C-M-=") #'writeroom-adjust-width))

;; ORG-CAPTURE
(define-key global-map (kbd "<f5>") 'org-capture)
(setq org-export-coding-system 'utf-8)

(setq org-capture-templates
      '(("t"
	 "TODO list item"
	 entry
	 ;; (file+headline org-default-notes-file "Tasks")
	 (file+headline "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/agenda.org" "General Tasks")
	 ;; "* TODO %?%^{Task}\n %i\n %a"
	 "* TODO %?%^{Task}\n"
	 )
	("Q"
	 "Quantum TODO list item"
	 entry
	 (file+headline "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/mapping_paper.org" "Tasks")
	 "** TODO %?%^{Task}\n"
	 )
	("j"
	 "Journal entry"
	 entry
	 (file+datetree "~/org/journal.org")
	 ;; (file "~/.emacs.d/org-templates/journal.orgcaptmpl")
	 "**** %U %^{Title} 
               %?"
	 )
	("T"
	 "Quantum thoughts"
	 entry
	 (file+headline "/ssh:daniel@koiserver.ddns.net:/home/daniel/Master/Quantum_Computing_and_Quantum_Information/mapping_paper.org" "Thoughts")
	 "** %U %^{Title}\n %?"
	 )
	("s"
	 "Code snippets"
	 entry
	 (file "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/snippets.org")
         "* %^{Snippet name}\t%^g\n#+BEGIN_SRC %^{language}\n%?\n#+END_SRC"
	 )
	("w"
	 "Searching for job TODO tasks"
	 entry
	 ;; (file+headline org-default-notes-file "Tasks")
	 (file+headline "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/buscar_trabajo.org" "Tasks")
	 ;; "* TODO %?%^{Task}\n %i\n %a"
	 "* TODO %?%^{Task}\n"
	 )
	("M"
	 "Tareas Malnascudes"
	 entry
	 ;; (file+headline org-default-notes-file "Tasks")
	 (file+headline "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/malnascudes.org" "Tasks")
	 ;; "* TODO %?%^{Task}\n %i\n %a"
	 "* TODO %?%^{Task}\n"
	 )
	("m"
	 "Music tasks"
	 entry
	 ;; (file+headline org-default-notes-file "Tasks")
	 (file+headline "/ssh:daniel@koiserver.ddns.net:/home/daniel/Documents/Agenda/music.org" "Tasks")
	 ;; "* TODO %?%^{Task}\n %i\n %a"
	 "* TODO %?%^{Task}\n"
	 )
	)
      )

;; ORG ADDING CUSTOM_ID
(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
(global-set-key (kbd "C-c l") 'org-store-link)

;; ;; functions for adding our custom

;; (defun eos/org-custom-id-get (&optional pom create prefix)
;;   "Get the CUSTOM_ID property of the entry at point-or-marker POM.
;;    If POM is nil, refer to the entry at point. If the entry does
;;    not have an CUSTOM_ID, the function returns nil. However, when
;;    CREATE is non nil, create a CUSTOM_ID if none is present
;;    already. PREFIX will be passed through to `org-id-new'. In any
;;    case, the CUSTOM_ID of the entry is returned."
;;   (interactive)
;;   (org-with-point-at pom
;;     (let ((id (org-entry-get nil "CUSTOM_ID")))
;;       (cond
;;        ((and id (stringp id) (string-match "\\S-" id))
;;         id)
;;        (create
;;         (setq id (org-id-new (concat prefix "h")))
;;         (org-entry-put pom "CUSTOM_ID" id)
;;         (org-id-add-location id (buffer-file-name (buffer-base-buffer)))
;;         id)))))

;; (defun eos/org-add-ids-to-headlines-in-file ()
;;   "Add CUSTOM_ID properties to all headlines in the current
;;    file which do not already have one. Only adds ids if the
;;    `auto-id' option is set to `t' in the file somewhere. ie,
;;    #+OPTIONS: auto-id:t"
;;   (interactive)
;;   (save-excursion
;;     (widen)
;;     (goto-char (point-min))
;;     (when (re-search-forward "^#\\+OPTIONS:.*auto-id:t" (point-max) t)
;;       (org-map-entries (lambda () (eos/org-custom-id-get (point) 'create))))))

;; (defun org-id-new (&optional prefix)
;;   "Create a new globally unique ID.

;; An ID consists of two parts separated by a colon:
;; - a prefix
;; - a unique part that will be created according to `org-id-method'.

;; PREFIX can specify the prefix, the default is given by the variable
;; `org-id-prefix'.  However, if PREFIX is the symbol `none', don't use any
;; prefix even if `org-id-prefix' specifies one.

;; So a typical ID could look like \"Org-4nd91V40HI\"."
;;   (let* ((prefix (if (eq prefix 'none)
;;                      ""
;;                    (concat (or prefix org-id-prefix) "-")))
;;          unique)
;;     (if (equal prefix "-") (setq prefix ""))
;;     (cond
;;      ((memq org-id-method '(uuidgen uuid))
;;       (setq unique (org-trim (shell-command-to-string org-id-uuid-program)))
;;       (unless (org-uuidgen-p unique)
;;         (setq unique (org-id-uuid))))
;;      ((eq org-id-method 'org)
;;       (let* ((etime (org-reverse-string (org-id-time-to-b36)))
;;              (postfix (if org-id-include-domain
;;                           (progn
;;                             (require 'message)
;;                             (concat "@" (message-make-fqdn))))))
;;         (setq unique (concat etime postfix))))
;;      (t (error "Invalid `org-id-method'")))
;;     (concat prefix unique)))

;; NAVI

(require 'navi-mode)

;; CLEANING ORG-MODE-HOOK

;; (remove-hook 'org-mode-hook 'org-ref-org-menu)
(remove-hook 'org-mode-hook 'ob-ipython-auto-configure-kernels)
