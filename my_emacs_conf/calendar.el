;; ORG CALENDAR

(global-set-key "\C-ca" 'org-agenda)

;; run the calendar when opening
(org-agenda)

;; ;; gcal

;; (require 'org-gcal)
;; (setq org-gcal-client-id "1037161849993-8qfn4b5gds7e8crtr6nt8mr2o3m7ehiq.apps.googleusercontent.com"
;;       org-gcal-client-secret "bipl7h7wl_zwyt3vjjyjqnpc"
;;       org-gcal-file-alist '(("l36qmkaau3a2pq3jjuvierjrfc@group.calendar.google.com" .  "/ssh:daniel@koiserver.ddns.net:~/documents/agenda.org")))

;; ;; alert

;; (require 'alert)
;; (require 'org-alert)
;; (setq alert-default-style 'libnotify)

;; ;; agenda context
;; (org-context-activate)

;; ;; org super agenda

;; (let ((org-super-agenda-groups
;;        '(;; each group has an implicit boolean or operator between its selectors.
;;          (:name "today"  ; optionally specify section name
;;                 :time-grid t  ; items that appear on the time grid
;;                 :todo "today")  ; items that have this todo keyword
;;          (:name "important"
;;                 ;; single arguments given alone
;;                 :tag "bills"
;;                 :priority "a")
;;          ;; set order of multiple groups at once
;;          (:order-multi (2 (:name "shopping in town"
;;                                  ;; boolean and group matches items that match all subgroups
;;                                  :and (:tag "shopping" :tag "@town"))
;;                           (:name "food-related"
;;                                  ;; multiple args given in list with implicit or
;;                                  :tag ("food" "dinner"))
;;                           (:name "personal"
;;                                  :habit t
;;                                  :tag "personal")
;;                           (:name "space-related (non-moon-or-planet-related)"
;;                                  ;; regexps match case-insensitively on the entire entry
;;                                  :and (:regexp ("space" "nasa")
;;                                                ;; boolean not also has implicit or between selectors
;;                                                :not (:regexp "moon" :tag "planet")))))
;;          ;; groups supply their own section names when none are given
;;          (:todo "waiting" :order 8)  ; set order of this section
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
;;          )))
;;   (org-agenda nil "a"))
