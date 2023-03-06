;; It contains all the defined functions used in the layer.

;; This file is loaded after packages.el and before config.el.

;; It is good practice to guard the definition of functions to make sure a package is actually used. For instance:

;; (when (configuration-layer/package-usedp 'my-package)
;;   (defun spacemacs/my-package-enable () ...)
;;   (defun spacemacs/my-package-disable () ...))

;; By guarding these functions we avoid to define them in case the package `my-package` is not used.
