;; It contains general key bindings.

;; This is the last file loaded.

;; The word general here means independent of any package. Since the end user can exclude an arbitrary set of packages, you cannot be sure that, just because your layer includes a package, that package will necessarily be loaded. For this reason, code in these files must be generally safe, regardless of which packages are installed.

;; More on this in the next section.



;; * MULTIPLE CURSORS

(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; * MAGIT
(global-set-key (kbd "C-x g") 'magit)

