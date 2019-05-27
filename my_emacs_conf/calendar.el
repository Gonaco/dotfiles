;; ORG CALENDAR

(global-set-key "\C-ca" 'org-agenda)

;; ADDING MORE KIND OF TODOS FOR THE WORKFLOW

(setq org-todo-keywords
  '((sequence "TODO(t)" "WAIT(w@/!)" "TEST(s)" "|" "DONE(d!)" "CANCELED(c@)")))

;; ;; ORG CALDAV

;; (setq org-caldav-oauth2-client-id "1037161849993-btbcm2nigt1eoofjr6oimpib096lb12a.apps.googleusercontent.com")
;; (setq org-caldav-oauth2-client-secret "PXIgrSj6rI5z7EfSKtrN193n")
;; (setq org-caldav-url "https://apidata.googleusercontent.com/caldav/v2/l36qmkaau3a2pq3jjuvierjrfc@group.calendar.google.com/events")
;; ;; (setq org-caldav-calendar-id "l36qmkaau3a2pq3jjuvierjrfc@group.calendar.google.com")
;; (setq org-caldav-inbox "~/google_cal_connection.org")
;; (setq org-caldav-files org-agenda-files)

;; ;; gcal

;; (require 'org-gcal)
;; (setq org-gcal-client-id "1037161849993-8qfn4b5gds7e8crtr6nt8mr2o3m7ehiq.apps.googleusercontent.com"
;;       org-gcal-client-secret "bipl7h7wl_zwyt3vjjyjqnpc"
;;       org-gcal-file-alist '(("l36qmkaau3a2pq3jjuvierjrfc@group.calendar.google.com" .  "/ssh:daniel@koiserver.ddns.net:~/documents/agenda.org")))

;; ;; agenda context
;; (org-context-activate)

;; ORG SUPER AGENDA

;; (let ((org-super-agenda-groups
;;        '(;; each group has an implicit boolean or operator between its selectors.
;;          (:name "today"  ; optionally specify section name
;;                 :time-grid t  ; items that appear on the time grid
;;                 :todo "today")  ; items that have this todo keyword
	 
;;          (:name "important"
;;                 ;; single arguments given alone
;;                 ;; :tag "bills"
;;                 :priority "a")
	 
;;          ;; set order of multiple groups at once
;;          (:order-multi (2 ;; (:name "shopping in town"
;;                           ;;        ;; boolean and group matches items that match all subgroups
;;                           ;;        :and (:tag "shopping" :tag "@town"))
;;                           ;; (:name "food-related"
;;                           ;;        ;; multiple args given in list with implicit or
;;                           ;;        :tag ("food" "dinner"))
;;                           (:name "personal"
;;                                  :habit t
;;                                  :tag "personal")
;;                           ;; (:name "space-related (non-moon-or-planet-related)"
;;                           ;;        ;; regexps match case-insensitively on the entire entry
;;                           ;;        :and (:regexp ("space" "nasa")
;;                           ;;                      ;; boolean not also has implicit or between selectors
;;                           ;;                      :not (:regexp "moon" :tag "planet")
;; 			  ;; ))			
;; 			  ))
      
;; 	 ;; groups supply their own section names when none are given
;; 	 (:todo "waiting" :order 8)  ; set order of this section
      
;;          (:todo ("someday" "to-read" "check" "to-watch" "watching")
;;                 ;; show this group at the end of the agenda (since it has the
;;                 ;; highest number). if you specified this group last, items
;;                 ;; with these todo keywords that e.g. have priority a would be
;;                 ;; displayed in that group instead, because items are grouped
;;                 ;; out in the order the groups are listed.
;;                 :order 9)
	 
;;          (:priority<= "b"
;;                       ;; show this section after "today" and "important", because
;;                       ;; their order is unspecified, defaulting to 0. sections
;;                       ;; are displayed lowest-number-first.
;;                       :order 1)
;;          ;; after the last group, the agenda will display items that didn't
;;          ;; match any of these groups, with the default order position of 99
;;          )
;;   ))
;;   (org-agenda nil "a"))

(org-super-agenda-mode)
(let ((org-super-agenda-groups
       '(
	 
	 (:name "Quantum Future attention!!"
		:and (:tag ("Future_Attention") :tag ("Mapping" "Benchmarks" "Fidelity")))

	 (:name "Waiting..."
		:and (:todo ("WAIT") :tag ("Mapping" "Benchmarks" "Fidelity")))

	 
	 (:name "Quantum"
		:tag ("Mapping" "Benchmarks" "Fidelity"))

	 ;; (:name "General Task"	
	 ;; 	(:priority<= "B"
	 ;; 		     ;; show this section after "today" and "important", because
	 ;; 		     ;; their order is unspecified, defaulting to 0. sections
	 ;; 		     ;; are displayed lowest-number-first.
	 ;; 		     :order 1)
	 ;; 	)

	 ;; (:order-multi (1
	 ;; 		(:name "Mapping task\n------------\n"
	 ;; 		       ;; single arguments given alone
	 ;; 		       :tag "Mapping")

	 ;; 		(:name "Benchmarks gathering\n--------------------\n"
	 ;; 		       ;; singnle arguments given alone
	 ;; 		       :tag "Benchmarks")

	 ;; 		(:name "Fidelity analysis\n-----------------\n"
	 ;; 		       ;; single arguments given alone
	 ;; 		       :tag "Fidelity")
	 ;; 		))

	 ;; (:name "Notas/Recordatorios\n"
	 ;; 	:heading-regexp "")

	 (:name "Proyectos personales"
		:tag "personal")

	 (:name "Learn\n"
		:heading-regexp "Flex")

	 ;; (:priority<= "B"
         ;;              ;; show this section after "today" and "important", because
         ;;              ;; their order is unspecified, defaulting to 0. sections
         ;;              ;; are displayed lowest-number-first.
         ;;              :order 1)

	 (:auto-category t)

	 )))  
  (setf initial-buffer-choice (lambda () (org-agenda nil "n"))))

;; ;; run the calendar when opening
;; (org-agenda)


;; CALFW

(require 'calfw-org)
(setq cfw:org-overwrite-default-keybinding t)
;; Month
(setq calendar-month-name-array
  ["January" "February" "March"     "April"   "May"      "June"
   "July"    "August"   "September" "October" "November" "December"])

;; Week days
(setq calendar-day-name-array
      ["Sunday" "Monday" "Tuesday" "Wednesday" "Thursday" "Friday" "Saturday"])

;; First day of the week
(setq calendar-week-start-day 0) ; 0:Sunday, 1:Monday
(cfw:open-org-calendar)

;; ;; ORG ALERT
;; (require 'org-alert)
;; (org-alert-enable)
;; (setq alert-default-style 'libnotify)

;; ORG WILD NOTIFIER
(require 'org-wild-notifier)
(org-wild-notifier-mode)
(setq alert-default-style 'osx-notifier)
(setq org-wild-notifier-keyword-whitelist '("TODO [#A]"))
(setq org-wild-notifier-alert-time 240)

