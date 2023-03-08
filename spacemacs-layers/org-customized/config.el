;; This file configure the layer like declaring layer variables default values and setup some other variables related to the layer.

;; This file is loaded after funcs.el.

;; ** ORG Agenda
(setq org-todo-keywords
      '(
        ;; (sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
        (sequence "BACKLOG(b)" "NEXT(n)" "DISCOVERY(p)" "READY(r)" "INPROGRESS(a)" "REVIEW(v)" "WAIT(w@/!)" "HOLD(h)" "|" "FOLLOWUP(f!)" "DONE(d!)" "DISCARDED(k@)")))
(setq org-clock-sound "/System/Library/Sounds/Glass.aiff")

;;  ;; Configure custom agenda views
;;  (setq org-agenda-custom-commands
;;   '(("d" "Dashboard"
;;     ((agenda "" ((org-deadline-warning-days 7)))
;;      (todo "NEXT"
;;        ((org-agenda-overriding-header "Next Tasks")))
;;      (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

;;    ("n" "Next Tasks"
;;     ((todo "NEXT"
;;        ((org-agenda-overriding-header "Next Tasks")))))

;;    ("W" "Work Tasks" tags-todo "+work-email")

;;    ;; Low-effort next actions
;;    ("e" tags-todo "+TODO=\"NEXT\"+Effort<15&+Effort>0"
;;     ((org-agenda-overriding-header "Low Effort Tasks")
;;      (org-agenda-max-todos 20)
;;      (org-agenda-files org-agenda-files)))

;;    ("w" "Workflow Status"
;;     ((todo "WAIT"
;;            ((org-agenda-overriding-header "Waiting on External")
;;             (org-agenda-files org-agenda-files)))
;;      (todo "REVIEW"
;;            ((org-agenda-overriding-header "In Review")
;;             (org-agenda-files org-agenda-files)))
;;      (todo "PLAN"
;;            ((org-agenda-overriding-header "In Planning")
;;             (org-agenda-todo-list-sublevels nil)
;;             (org-agenda-files org-agenda-files)))
;;      (todo "BACKLOG"
;;            ((org-agenda-overriding-header "Project Backlog")
;;             (org-agenda-todo-list-sublevels nil)
;;             (org-agenda-files org-agenda-files)))
;;      (todo "READY"
;;            ((org-agenda-overriding-header "Ready for Work")
;;             (org-agenda-files org-agenda-files)))
;;      (todo "ACTIVE"
;;            ((org-agenda-overriding-header "Active Projects")
;;             (org-agenda-files org-agenda-files)))
;;      (todo "COMPLETED"
;;            ((org-agenda-overriding-header "Completed Projects")
;;             (org-agenda-files org-agenda-files)))
;;      (todo "CANC"
;;            ((org-agenda-overriding-header "Cancelled Projects")
;;             (org-agenda-files org-agenda-files)))))))

;; ** ORG Tags

;; (setq org-tag-alist
;;    '((:startgroup)
;;       ; Put mutually exclusive tags here
;;       (:endgroup)
;;       ("@errand" . ?E)
;;       ("@work" . ?W)
;;       ("agenda" . ?a)
;;       ("planning" . ?p)
;;       ("publish" . ?P)
;;       ("batch" . ?b)
;;       ("note" . ?n)
;;       ("doc" . ?d)
;;       ("idea" . ?i)))


;; ** ORG Capture

(setq org-capture-templates
      `(
        ("t" "Tasks")
        ("tt" "General Task" entry (file+olp "~/Google Drive/My Drive/DriveSyncFiles/org/notes.org")
         "*** BACKLOG %?\n  %U\n  %a\n  %i" :empty-lines 1)
        ("ti" "General Project" entry (file+olp "~/Google Drive/My Drive/DriveSyncFiles/org/notes.org")
         "** %?\n  %U\n  %a\n  %i" :empty-lines 1)
        ("ta" "Tasks")
        ("tat" "Task in an audio project" entry (file+olp "~/Google Drive/My Drive/DriveSyncFiles/org/projects/audio_projects.org")
         "*** BACKLOG %?\n  %U\n  %a\n  %i" :empty-lines 1)

        ("tai" "Audio Project" entry (file+olp "~/Google Drive/My Drive/DriveSyncFiles/org/projects/audio_projects.org" "Initiative / Project")
         "** %?\n  %U\n  %a\n  %i" :empty-lines 1)

        ("d" "Doc entry" entry
         "\n*** %?\n  %U\n  %a\n  %i :doc:\n\n%?\n\n"
         ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
         :clock-in :clock-resume
         :empty-lines 1)

        ("j" "Journal Entries")
        ("jj" "Journal" entry
         (file+olp+datetree "~/Google Drive/My Drive/DriveSyncFiles/org/journal.org")
         "\n* %<%I:%M %p> - Journal :journal:\n\n%?\n\n"
         ;; ,(dw/read-file-as-string "~/Notes/Templates/Daily.org")
         :clock-in :clock-resume
         :empty-lines 1)
        ;; ("jm" "Meeting" entry
        ;;      (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
        ;;      "* %<%I:%M %p> - %a :meetings:\n\n%?\n\n"
        ;;      :clock-in :clock-resume
        ;;      :empty-lines 1)

        ;; ("w" "Workflows")
        ;; ("we" "Checking Email" entry (file+olp+datetree "~/Projects/Code/emacs-from-scratch/OrgFiles/Journal.org")
        ;;      "* Checking Email :email:\n\n%?" :clock-in :clock-resume :empty-lines 1)

        ;; ("m" "Metrics Capture")
        ;; ("mw" "Weight" table-line (file+headline "~/Projects/Code/emacs-from-scratch/OrgFiles/Metrics.org" "Weight")
        ;;  "| %U | %^{Weight} | %^{Notes} |" :kill-buffer t)
        ))

;; (define-key global-map (kbd "C-c j")
;;   (lambda () (interactive) (org-capture nil "jj")))


