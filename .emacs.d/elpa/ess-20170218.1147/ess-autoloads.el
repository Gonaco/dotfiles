;;; ess-autoloads.el --- Emacs Speaks Statistics: statistical programming within Emacs

;; Copyright (C) 2012 Donald E. Curtis
;; Copyright (C) 2014 The ESS Core Team

;; Original Author: Donald E. Curtis
;; Created: March 5, 2012
;; Maintainers: ESS-core <ESS-core@r-project.org>

;; Keywords: autoload, startup, configuration, package.el
;; Summary: essential autoloads for ESS

;; This file is part of ESS

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
;; GNU General Public License for more details.
;;
;; A copy of the GNU General Public License is available at
;; http://www.r-project.org/Licenses/
;;
;; In short: you may use this code any way you like, as long as you
;; don't charge money for it, remove this notice, or hold anyone liable
;; for its results.

;;; Commentary:

;;; This file is just a wrapper so that ESS will be more `package.el'
;;; friendly.  This is just a list of functions that require loading
;;; of ESS through `ess-site'.

;;; Code:

;;*;; Requires and autoloads
;;;=====================================================
;;;

(when (boundp 'load-path)
  (add-to-list 'load-path
               (file-name-as-directory
                (expand-file-name
                 "lisp"
                 (file-name-directory load-file-name)))))

(autoload 'R "ess-site" "Call 'R', the 'GNU S' system from the R Foundation.
Optional prefix (C-u) allows to set command line arguments, such as
--vsize.  This should be OS agnostic.
If you have certain command line arguments that should always be passed
to R, put them in the variable `inferior-R-args'." t)

(autoload 'R-mode "ess-site.el" "Major mode for editing R source." t)
(add-to-list 'auto-mode-alist '("\\.R$" . R-mode))

(autoload 'S "ess-site" "Call 'S'." t)


;;;### (autoloads nil nil ("ess-pkg.el") (22697 50086 25824 807000))

;;;***
 ; Local variables section

;;; This file is automatically placed in Outline minor mode.
;;; The file is structured as follows:
;;; Chapters:	  ^L ;
;;; Sections:	 ;;*;;
;;; Subsections: ;;;*;;;
;;; Components:	 defuns, defvars, defconsts
;;;		 Random code beginning with a ;;;;* comment

;;; Local variables:
;;; mode: emacs-lisp
;;; mode: outline-minor
;;; outline-regexp: "\^L\\|\\`;\\|;;\\*\\|;;;\\*\\|(def[cvu]\\|(setq\\|;;;;\\*"
;;; End:

;;; ess-autoloads.el ends here

