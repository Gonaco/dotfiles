;;; packages.el --- org-customized layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: Daniel <daniel@daniels-mbp.home>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `org-customized-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `org-customized/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `org-customized/pre-init-PACKAGE' and/or
;;   `org-customized/post-init-PACKAGE' to customize the package as it is loaded.

;; (defconst mylayer-packages
;;   '(
;;     ;; Get the package from MELPA, ELPA, etc.
;;     some-package
;;     (some-package :location elpa)

;;     ;; A local package
;;     (some-package :location local)

;;     ;; A local package to be built with Quelpa
;;     (some-package :location (recipe :fetcher local))

;;     ;; A package recipe
;;     (some-package :location (recipe
;;                              :fetcher github
;;                              :repo "some/repo"))

;;     ;; An excluded package
;;     (some-package :excluded t)
;;     ))

;;; Code:

(defconst org-customized-packages
  '(
    ;; ** ORG Roam required

    ;; *** sqlite3 for M2 chips
    ;; sqlite3
    ;; emacsql-sqlite3

    ;; (org-roam :location elpa)

    ;; (require 'org-super-agenda)
    ;; org-super-agenda
    )
  "The list of Lisp packages required by the custom layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

    (defun org-customized/post-init-org-roam ()
      (message "START org-customized/init-org-roam")

      (message "END org-customized/init-org-roam")
    )

(defun org-customized/init-emacsql-sqlite3 ()
  (message "START org-customized/init-emacsql-sqlite3")
  (straight-use-package 'emacsql-sqlite3)
  )

(defun org-customized/init-sqlite3 ()
  (message "START org-customized/init-sqlite3")
  (straight-use-package 'sqlite3)
  )

