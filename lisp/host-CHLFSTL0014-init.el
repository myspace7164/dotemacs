(setq my/system-theme 'modus-operandi)
(setq my/org-directory "c:/Users/Abru/org/")
(setq my/browse-url-browser-function 'browse-url-default-browser)
(setq my/default-font "Iosevka-10")

(setq my/org-agenda-custom-commands nil)

(setq my/org-capture-templates
        '(("i" "Inbox" entry (file+headline "frey_ag.org" "Inbox")
           "* %?")
          ("m" "Meeting notes" entry (file+headline "frey_ag.org" "Meetings")
           "* %U %^{Title}\n%?")
          ("M" "Meeting notes (custom datetime)" entry (file+headline "frey_ag.org" "Meetings")
           "* %^U %^{Title}\n%?")
          ("j" "Journal" entry (file+olp+datetree "frey_ag.org" "Journal")
           "* %U %^{Title}\n%?")
          ("J" "Journal (custom datetime)" entry (file+olp+datetree "frey_ag.org" "Journal")
           "* %U %^{Title}\n%?" :time-prompt t)))
