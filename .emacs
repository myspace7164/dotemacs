(use-package package
  :init
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (package-initialize))

(use-package gcmh
  :ensure t
  :init
  (gcmh-mode 1))

(use-package auth-source
  :custom
  (auth-source-save-behavior nil))

(use-package autorevert
  :config
  (global-auto-revert-mode 1))

(use-package bibtex
  :hook (bibtex-mode . (lambda () (setq-local fill-column 10000))))

(use-package calendar
  :config
  (setq calendar-week-start-day 1))

(use-package cape
  :ensure t
  :commands cape-file
  :init
  (add-hook 'completion-at-point-functions #'cape-file))

(use-package cdlatex
  :ensure t)

;; (use-package citar
;;   :ensure t
;;   :bind (("C-c w c" . citar-create-note)
;;          ("C-c w o" . citar-open)
;;          ("C-c w F" . citar-open-files)
;;          ("C-c w N" . citar-open-notes))
;;   :hook ((LaTeX-mode . citar-capf-setup)
;;          (org-mode . citar-capf-setup))
;;   :config
;;   (setq citar-bibliography '("~/Documents/books/references.bib"))
;;   (setq citar-library-paths '("~/Documents/books"))
;;   (setq citar-notes-paths '("~/Documents/books/notes"))

;; (use-package citar-denote
;;   :ensure t
;;   :bind (("C-c w f" . citar-denote-open-file)
;;          ("C-c w n" . citar-denote-open-note)
;;          ("C-c w d" . citar-denote-dwim)
;;          ("C-c w e" . citar-denote-open-reference-entry)
;;          ("C-c w a" . citar-denote-add-citekey)
;;          ("C-c w k" . citar-denote-remove-citekey)
;;          ("C-c w r" . citar-denote-find-reference)
;;          ("C-c w l" . citar-denote-link-reference)
;;          ("C-c w i" . citar-denote-find-citation)
;;          ("C-c w x" . citar-denote-nocite)
;;          ("C-c w y" . citar-denote-cite-nocite)
;;          ("C-c w z" . citar-denote-nobib))
;;   :config
;;   (citar-denote-mode 1)

;;   (defun citar-denote-open-file (&optional prefix)
;;     (interactive "P")
;;     (let* ((file buffer-file-name)
;;            (citekey (citar-denote--retrieve-references file)))
;;       (if prefix (other-window-prefix))
;;       (citar-open-files citekey))))

;; (use-package citar-embark
;;   :ensure t
;;   :after citar embark
;;   :config
;;   (citar-embark-mode 1))

(use-package comp
  :config
  (setq native-comp-async-report-warnings-errors nil))

(use-package consult
  :ensure t
  :bind (;; C-c bindings in `mode-specific-map'
         ("C-c M-x" . consult-mode-command)
         ("C-c h" . consult-history)
         ("C-c k" . consult-kmacro)
         ("C-c m" . consult-man)
         ("C-c i" . consult-info)
         ("C-c o" . consult-org-agenda)
         ([remap Info-search] . consult-info)
         ;; C-x bindings in `ctl-x-map'
         ("C-x M-:" . consult-complex-command)     ;; orig. repeat-complex-command
         ("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
         ("C-x 4 b" . consult-buffer-other-window) ;; orig. switch-to-buffer-other-window
         ("C-x 5 b" . consult-buffer-other-frame)  ;; orig. switch-to-buffer-other-frame
         ("C-x t b" . consult-buffer-other-tab)    ;; orig. switch-to-buffer-other-tab
         ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
         ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
         ;; Custom M-# bindings for fast register access
         ("M-#" . consult-register-load)
         ("M-'" . consult-register-store)          ;; orig. abbrev-prefix-mark (unrelated)
         ("C-M-#" . consult-register)
         ;; Other custom bindings
         ("M-y" . consult-yank-pop)                ;; orig. yank-pop
         ;; M-g bindings in `goto-map'
         ("M-g e" . consult-compile-error)
         ("M-g f" . consult-flymake)               ;; Alternative: consult-flycheck
         ("M-g g" . consult-goto-line)             ;; orig. goto-line
         ("M-g M-g" . consult-goto-line)           ;; orig. goto-line
         ("M-g o" . consult-outline)               ;; Alternative: consult-org-heading
         ("M-g m" . consult-mark)
         ("M-g k" . consult-global-mark)
         ("M-g i" . consult-imenu)
         ("M-g I" . consult-imenu-multi)
         ;; M-s bindings in `search-map'
         ("M-s d" . consult-find)                  ;; Alternative: consult-fd
         ("M-s c" . consult-locate)
         ("M-s g" . consult-grep)
         ("M-s G" . consult-git-grep)
         ("M-s r" . consult-ripgrep)
         ("M-s l" . consult-line)
         ("M-s L" . consult-line-multi)
         ("M-s k" . consult-keep-lines)
         ("M-s u" . consult-focus-lines)
         ;; Isearch integration
         ("M-s e" . consult-isearch-history)
         ;; Org-mode
         ("C-c s" . my/consult-search-org-files)
         :map isearch-mode-map
         ("M-e" . consult-isearch-history)         ;; orig. isearch-edit-string
         ("M-s e" . consult-isearch-history)       ;; orig. isearch-edit-string
         ("M-s l" . consult-line)                  ;; needed by consult-line to detect isearch
         ("M-s L" . consult-line-multi)            ;; needed by consult-line to detect isearch
         ;; Minibuffer history
         :map minibuffer-local-map
         ("M-s" . consult-history)                 ;; orig. next-matching-history-element
         ("M-r" . consult-history))

  :init
  (setq register-preview-delay 0.5)
  (setq register-preview-function #'consult-register-format)

  (advice-add #'register-preview :override #'consult-register-window)

  (setq xref-show-xrefs-function #'consult-xref)
  (setq xref-show-definitions-function #'consult-xref)

  :config
  (defun my/consult-search-org-files ()
    (interactive)
    (consult-ripgrep org-agenda-files)))

(use-package corfu
  :ensure t
  :custom
  (corfu-auto t)
  :config
  (defun corfu-enable-always-in-minibuffer ()
    "Enable Corfu in the minibuffer if Vertico/Mct are not active."
    (unless (or (bound-and-true-p mct--active)
                (bound-and-true-p vertico--input)
                (eq (current-local-map) read-passwd-map))
      ;; (setq-local corfu-auto nil) ;; Enable/disable auto completion
      (setq-local corfu-echo-delay nil ;; Disable automatic echo and popup
                  corfu-popupinfo-delay nil)
      (corfu-mode 1)))
  (add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)
  (global-corfu-mode 1))

(use-package csv-mode
  :ensure t
  :mode "\\.csv\\'"
  :hook (csv-mode . csv-guess-set-separator)
  :bind (("C-c C-b" . csv-backward-field)
         ("C-c C-f" . csv-forward-field)
         :repeat-map csv-mode-repeat-map
         ("C-b" . csv-backward-field)
         ("C-f" . csv-forward-field)
         ("b" . csv-backward-field)
         ("f" . csv-forward-field)))

(use-package cus-edit
  :config
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (load custom-file))

(use-package delsel
  :config
  (delete-selection-mode 1))

;; (use-package denote
;;   :ensure t
;;   :bind (("C-c n n" . denote)
;;          ("C-c n o" . denote-open-or-create)
;;          ("C-c n c" . denote-region)
;;          ("C-c n N" . denote-type)
;;          ("C-c n d" . denote-date)
;;          ("C-c n z" . denote-signature)
;;          ("C-c n s" . denote-subdirectory)
;;          ("C-c n t" . denote-template)
;;          ("C-c n r" . denote-rename-file)
;;          ("C-c n R" . denote-rename-file-using-front-matter)
;;          :map org-mode-map :package org
;;          ("C-c n k" . denote-keywords-add)
;;          ("C-c n K" . denote-keywords-remove)
;;          ("C-c n i" . denote-link-or-create)
;;          ("C-c n I" . denote-add-links)
;;          ("C-c n b" . denote-backlinks)
;;          ("C-c n f f" . denote-find-link)
;;          ("C-c n f b" . denote-find-backlink)
;;          :map dired-mode-map :package dired
;;          ("C-c C-d C-i" . denote-link-dired-marked-notes)
;;          ("C-c C-d C-r" . denote-dired-rename-files)
;;          ("C-c C-d C-k" . denote-dired-rename-marked-files-with-keywords)
;;          ("C-c C-d C-R" . denote-dired-rename-marked-files-using-front-matter))
;;   :hook (dired-mode . denote-dired-mode-in-directories)
;;   :config
;;   ;; TODO: add optional extension
;;   ;; TODO: handle denote keywords properly
;;   ;; TODO: optional output-dir
;;   (defun my/denote-uml-file (description)
;;     (concat (file-name-sans-extension (file-name-nondirectory buffer-file-name)) "-" description "__"  "uml" ".svg"))

;;   (setq denote-directory "~/Documents/notes")
;;   (setq denote-dired-directories (list denote-directory)))

(use-package dired
  :bind (nil
         :map dired-mode-map
         ("b" . dired-up-directory))
  :hook (dired-mode . dired-hide-details-mode)
  :custom
  (dired-auto-revert-buffer t)
  (dired-recursive-copies 'always)
  (dired-recursive-deletes 'always)
  (dired-listing-switches "-AGhlv --group-directories-first")

  (dired-create-destination-dirs 'always)
  (dired-create-destination-dirs-on-trailing-dirsep t)

  (wdired-allow-to-change-permissions t)
  :config
  (when (string= system-type "darwin")
    (setq dired-use-ls-dired nil)))

(use-package dired-subtree
  :ensure t
  :after dired
  :bind (nil
         :map dired-mode-map
         ("<tab>" . dired-subtree-toggle)
         ("<backtab>" . dired-subtree-cycle))
  :custom
  (dired-subtree-use-backgrounds nil))

(use-package direnv
  :ensure t)

(use-package display-line-numbers
  :hook (prog-mode . display-line-numbers-mode))

(use-package eglot
  :hook (python-mode . eglot-ensure))

(use-package eldoc
  :custom
  (eldoc-echo-area-prefer-doc-buffer t)
  (eldoc-echo-area-use-multiline-p nil))

(use-package elec-pair
  :hook ((comint-mode . electric-pair-local-mode)
         (prog-mode . electric-pair-local-mode)))

(use-package emacs
  :bind ("M-Q" . unfill-paragraph)
  :config
  (tool-bar-mode -1)

  (setq visible-bell t)

  (setq delete-by-moving-to-trash t)
  (setq enable-recursive-minibuffers t)
  (setq mac-right-option-modifier "none")
  (setq use-short-answers t)

  (setq-default tab-width 4)
  (setq tab-always-indent 'complete)

  (defun unfill-paragraph (&optional region)
    "Takes a multi-line paragraph and makes it into a single line of text."
    (interactive (progn (barf-if-buffer-read-only) '(t)))
    (let ((fill-column (point-max))
	      ;; This would override `fill-column' if it's an integer.
	      (emacs-lisp-docstring-fill-column t))
      (fill-paragraph nil region)))

  (add-to-list 'default-frame-alist '(font . "Iosevka-10"))

  (setq read-buffer-completion-ignore-case t))

(use-package emacs
  :if (and (member (system-name) '("CHLFSTL0014")) (or window-system (daemonp)))
  :config
  (menu-bar-mode -1))

(use-package ef-themes
  :if (and (member (system-name) '("thinkpad" "desktop" "CHLFSTL0014")) (or window-system (daemonp)))
  :ensure t
  :config
  (load-theme 'ef-owl :no-confirm))

(use-package embark
  :ensure t
  :bind (("C-." . embark-act)
	     ("C-;" . embark-dwim)
	     ("C-h B" . embark-bindings))
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

(use-package faces
  :config
  (set-face-attribute 'default nil :font "Iosevka-10"))

(use-package files
  :config
  (make-directory (locate-user-emacs-file "lock-files") t)
  (setq lock-file-name-transforms `((".*" ,(locate-user-emacs-file "lock-files/\\1") t)))
  (setq backup-directory-alist `(("." . ,(locate-user-emacs-file "backups"))))
  (setq backup-by-copying t)
  (setq version-control t)
  (setq delete-old-versions t))

(use-package flyspell
  :bind (nil
         :map ctl-x-x-map
         ("s" . flyspell-mode)))

(use-package hl-line
  :hook ((dired-mode . hl-line-mode)
         (org-agenda-mode . hl-line-mode)
         (prog-mode . hl-line-mode)))

(use-package ispell
  :custom
  (ispell-program-name "hunspell"))

;; (use-package lin
;;   :ensure t
;;   :if (window-system)
;;   :config
;;   (setq lin-mode-hooks '(dired-mode-hook
;; 			             org-agenda-mode-hook
;;                          prog-mode-hook))
;;   (lin-global-mode 1))

(use-package magit
  :ensure t
  :defer t
  :config
  (setq magit-repository-directories '(("~" . 1)
                                       ("~/src" . 1)
                                       ("~/.mozilla/firefox" . 1)
                                       ("~/Mozilla/Firefox/Profiles" . 1))))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'")

(use-package matlab-mode
  :if (member (system-name) '("CHLFSTL0014"))
  :ensure t)
(use-package minibuffer
  :config
  (setq completion-cycle-threshold 3)
  (setq read-file-name-completion-ignore-case t))

(use-package minions
  :ensure t
  :custom
  (minions-mode-line-lighter ":")
  :config
  (minions-mode 1))

(use-package mu4e
  :commands (mu4e)
  :hook ((dired-mode-hook . turn-on-gnus-dired-mode)
         (mu4e-compose-mode-hook . flyspell-mode))
  :bind (nil
         :map mu4e-headers-mode-map
         ("C-c c" . mu4e-org-store-and-capture)
         :map mu4e-view-mode-map
         ("C-c c" . mu4e-org-store-and-capture))
  :config
  (setq mail-user-agent 'mu4e-user-agent)
  (setq message-mail-user-agent 'mu4e-user-agent)
  (set-variable 'read-mail-command 'mu4e)

  (setq mu4e-change-filenames-when-moving t)
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-update-interval 300)
  (setq mu4e-attachment-dir "~/Downloads")
  
  (setq mu4e-read-option-use-builtin nil)
  (setq mu4e-completing-read-function 'completing-read)
  (setq mu4e-confirm-quit nil)
  (setq mu4e-notification-support t)

  (setq mu4e-contexts
        `(,(make-mu4e-context
            :name "yarn8369@proton.me"
            :vars '((user-mail-address . "yarn8369@proton.me")
                    (user-full-name . "yarn8369")
                    (message-signature . nil)))
          ,(make-mu4e-context
            :name "alex@bruun.xyz"
            :vars '((user-mail-address . "alex@bruun.xyz")
                    (user-full-name . "Alexander Bruun")
                    (message-signature . "Alexander Bruun")))))

  (setq mu4e-sent-folder "/Sent")
  (setq mu4e-drafts-folder "/Drafts")
  (setq mu4e-trash-folder "/Trash")
  (setq mu4e-refile-folder "/Archive")

  (setq sendmail-program "/usr/bin/msmtp")
  (setq message-sendmail-f-is-evil t)
  (setq message-sendmail-extra-arguments '("--read-envelope-from"))
  (setq send-mail-function 'smtpmail-send-it)
  (setq message-send-mail-function 'message-send-mail-with-sendmail)
  (setq message-kill-buffer-on-exit t))

(use-package mu4e-icalendar
  :after mu4e org-agenda
  :config
  (mu4e-icalendar-setup)
  (setq mu4e-icalendar-trash-after-reply t)
  (setq gnus-icalendar-org-capture-file "~/Nextcloud/org/calendar.org")
  (setq gnus-icalendar-org-capture-headline '("iCalendar events"))
  (gnus-icalendar-org-setup))

(use-package ob-core
  :hook (org-babel-after-execute . org-redisplay-inline-images))

(use-package ob-java
  :after org
  :config
  (org-babel-do-load-languages 'org-babel-load-languages '((java . t)))
  (nconc org-babel-default-header-args:java '((:dir . nil))))

(use-package ob-python
  :after org
  :config
  (org-babel-do-load-languages 'org-babel-load-languages '((python . t))))

(use-package ob-plantuml
  :after (org plantuml-mode)
  :config
  (setq org-plantuml-jar-path plantuml-jar-path)
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages '((plantuml . t))))

;; (use-package oc
;;   :after citar org
;;   :bind ("C-c b" . org-cite-insert)
;;   :custom
;;   (org-cite-global-bibliography citar-bibliography)
;;   (org-cite-insert-processor 'citar)
;;   (org-cite-follow-processor 'citar)
;;   (org-cite-activate-processor 'citar))

(use-package ol
  :after org-id
  :bind ("C-c l" . org-store-link)
  :config
  (defun my/org-id-link-description (link desc)
    "Return description for `id:` links. Use DESC if non-nil, otherwise fetch headline."
    (or desc
        (let ((id (substring link 3)) ; remove "id:" prefix
              (headline nil))
          (org-map-entries
           (lambda ()
             (when (string= (org-id-get) id)
               (setq headline (nth 4 (org-heading-components)))))
           nil 'file)
          headline)))
  
  (org-link-set-parameters "id"
                           :complete (lambda () (concat "id:" (org-id-get-with-outline-path-completion)))
                           :insert-description 'my/org-id-link-description))

(use-package ol-man :after org)

(use-package org
  :bind (nil
         :repeat-map org-mode-repeat-map
         ("<tab>" . org-cycle)
         ("<backtab>" . org-shifttab)
         ("C-n" . org-next-visible-heading)
         ("C-p" . org-previous-visible-heading)
         ("n" . org-next-visible-heading)
         ("p" . org-previous-visible-heading))
  :hook ((org-mode . turn-on-org-cdlatex)
         (org-mode . visual-line-mode))
  :config
  (setq org-directory "~/org")
  (when (member (system-name) '("WINDOWS"))
    (setq org-directory "C:/Users/alexb/kDrive/org"))
  (when (member (system-name) '("CHLFSTL0014"))
    (setq org-directory "//1289291.connect.kdrive.infomaniak.com@SSL/DavWWWRoot/org/"))
  
  (setq org-agenda-files (list org-directory "~/.local/share/org"))
  (when (member (system-name) '("WINDOWS" "CHLFSTL0014"))
    (setq org-agenda-files (list org-directory)))

  (setq org-default-notes-file (concat org-directory "notes.org"))

  (setq org-special-ctrl-k t)

  (setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s)" "WAITING(w@/!)" "|" "DONE(d)" "CANCELED(c@)")))
  (setq org-use-fast-todo-selection 'expert)

  (setq org-log-done 'time)
  (setq org-log-into-drawer t)
  (setq org-startup-indented t)
  (setq org-startup-folded 'fold)

  (setq org-image-actual-width nil)

  (add-to-list 'org-structure-template-alist '("p" . "src python") t)
  (add-to-list 'org-structure-template-alist '("P" . "src plantuml") t)

  (setq org-preview-latex-image-directory "~/.local/share/ltximg/")
  (setq org-preview-latex-default-process 'dvisvgm)
  
  (plist-put org-format-latex-options :foreground nil)
  (plist-put org-format-latex-options :background nil)

  (when (member (system-name) '("thinkpad"))
    (plist-put org-format-latex-options :scale 0.3)))

(use-package org
  :if (member (system-name) '("CHLFSTL0014"))
  :config
  (setq org-duration-format '(("h" . t) (special . 2))))

(use-package org-agenda
  :bind ("C-c a" . org-agenda)
  :config
  (setq org-agenda-custom-commands '(("i" "Inbox" tags-todo "+inbox")
	                                 ("s" "Shopping List" tags-todo "+buy")
                                     ("o" "Todo" tags-todo "-project-someday-@aabacka/!-WAITING"
                                      ((org-agenda-skip-function '(org-agenda-skip-subtree-if 'scheduled))
                                       (org-agenda-skip-function '(org-agenda-skip-subtree-if 'deadline))
                                       (org-agenda-skip-function '(org-agenda-skip-subtree-if 'timestamp))))
                                     ("w" "Waiting" tags "/WAITING")
                                     ("S" "Someday" tags-todo "+someday"))))

;; NOTE: Probably broken in org 9.7
;; (use-package org-appear
;;   :ensure t
;;   :hook (org-mode . org-appear-mode)
;;   :custom
;;   (org-appear-autolinks t)
;;   (org-appear-autosubmarkers t)
;;   (org-appear-autoentities t)
;;   (org-appear-inside-latex t))

(use-package org-capture
  :bind ("C-c c" . org-capture)
  :config
  (setq org-capture-templates '(("i" "Inbox" entry (file+headline "notes.org" "Inbox")
                                 "* %?\n%U")
                                ("t" "Task" entry (file+headline "notes.org" "Tasks")
                                 "* TODO %?\n%U")
                                ("m" "Mail" entry (file+headline "notes.org" "Inbox")
                                 "* %:fromname\n%U\n%a\n%?")
                                ("j" "Journal" entry (file+olp+datetree "notes.org" "Journal")
                                 "* %U %^{Title}\n%U\n%?")
                                ("J" "Journal (custom datetime)" entry (file+olp+datetree "notes.org" "Journal")
                                 (file "~/Templates/journal.org") :time-prompt t)
                                ("p" "Protocol" entry (file+headline "notes.org" "Inbox")
                                 "* %^{Title}\n%U\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?")
	                            ("L" "Protocol Link" entry (file+headline "notes.org" "Inbox")
                                 "* %?[[%:link][%:description]] \n%U")))
  (when (member (system-name) '("CHLFSTL0014"))
    (setq org-capture-templates '(("i" "Inbox" entry (file+headline "frey_ag.org" "Inbox")
                                   "* %?")
                                  ("m" "Meeting notes" entry (file+headline "frey_ag.org" "Meetings")
                                   "* %U %^{Title}\n%?")
                                  ("M" "Meeting notes (custom datetime)" entry (file+headline "frey_ag.org" "Meetings")
                                   "* %^U %^{Title}\n%?")
                                  ("j" "Journal" entry (file+olp+datetree "frey_ag.org" "Journal")
                                   "* %U %^{Title}\n%?")
                                  ("J" "Journal (custom datetime)" entry (file+olp+datetree "frey_ag.org" "Journal")
                                   "* %U %^{Title}\n%?" :time-prompt t)))))

;; TODO This needs some fixing, org-latex-previews are toggled even when latex previews are disabled
;; Write a function toggle-org-fragtog (or similar) which when enabled, will generate all latex previews and enable org-fragtog-mode, if org-fragtog-mode is disabled, no latex previews should be generated
;; (use-package org-fragtog
;;   :ensure t
;;   :hook (org-mode . org-fragtog-mode))

(use-package org-caldav
  :if (member (system-name) '("thinkpad" "desktop"))
  :ensure t
  :after org
  ;; :hook (kill-emacs . org-caldav-sync-at-close)
  ;; :init
  ;; (defun org-caldav-sync-at-close ()
  ;;   (org-caldav-sync)
  ;;   (save-some-buffers))
  :config
  (setq org-caldav-url (plist-get (car (auth-source-search :machine "sync.infomaniak.com:443" :max 1)) :url))
  (setq org-caldav-calendar-id (plist-get (car (auth-source-search :machine "sync.infomaniak.com:443" :max 1)) :id))
  (setq org-caldav-inbox "~/.local/share/org/calendar.org")
  (setq org-caldav-files nil)
  ;; (setq org-caldav-show-sync-results nil)

  ;; (run-at-time nil (* 5 60) 'org-caldav-sync)
  )

(use-package org-faces
  :after org
  :config
  (setq org-todo-keyword-faces '(("STARTED" . org-scheduled)
                                 ("WAITING" . "orange")
                                 ("CANCELED" . "gray"))))

(use-package org-id
  :after org
  :config
  (setq org-id-link-to-org-use-id t))

(use-package org-keys
  :after org
  :config
  (setq org-use-speed-commands t))

(use-package org-pdftools
  :ensure t
  :if (member (system-name) '("thinkpad"))
  :hook (org-mode . org-pdftools-setup-link))

(use-package org-protocol)

(use-package org-refile
  :commands (org-refile) ; not sure why this is required, without it, org-refile does not load lazily, and if i use :after org, the keybinding is not defined
  ;; :bind ("C-c o" . (lambda () (interactive) (org-refile '(1))))
  :config
  (setq org-outline-path-complete-in-steps nil)
  (setq org-refile-use-outline-path 'file)
  (setq org-refile-allow-creating-parent-nodes 'confirm)
  (setq org-refile-targets '((org-agenda-files . (:maxlevel . 9)))))

(use-package org-src
  :after org
  :config
  (setq org-edit-src-content-indentation 0))

(use-package org-tempo :after org)

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package outline
  :bind (nil
         :repeat-map outline-navigation-repeat-map
         ("<tab>" . outline-cycle)
         ("<backtab>" . outline-cycle-buffer))
  :hook ((LaTeX-mode . outline-minor-mode)
         (prog-mode . outline-minor-mode))
  :custom
  (outline-minor-mode-cycle t))

(use-package ox-publish
  :defer t
  :config
  (setq org-publish-project-alist
        '(("org-notes"
           :base-directory "~/Documents/notes"
           :exclude ".*_nopublish.*"
           :publishing-directory "/tmp/public"
           :recursive t
           :publishing-function org-html-publish-to-html
           :headline-levels 4
           :auto-preamble t
           :auto-sitemap t
           :sitemap-filename "sitemap.html"
           :sitemap-title "Sitemap")
          ("images"
           :base-directory "~/Documents/notes/images"
           :base-extension "png\\|svg"
           :exclude ".*_nopublish.*"
           :publishing-directory "/tmp/public/images"
           :recursive t
           :publishing-function org-publish-attachment))))

(use-package pascal-mode
  :mode "\\.\\(pou\\|st\\)\\'")

(use-package pdf-tools
  :if (member (system-name) '("thinkpad"))
  :ensure t
  :magic ("%PDF" . pdf-view-mode)
  :config
  (pdf-tools-install :no-query))

(use-package pixel-scroll
  :if (version<= "29.1" emacs-version)
  :config
  (pixel-scroll-precision-mode 1))

(use-package plantuml-mode
  :ensure t
  :demand t
  :mode "\\.plantuml\\'"
  :custom
  (plantuml-jar-path "~/.local/share/plantuml/plantuml.jar"))

(use-package python
  :bind (nil
         :repeat-map python-repeat-map
         ("<" . python-indent-shift-left)
         (">" . python-indent-shift-right)))

(use-package recentf
  :config
  (recentf-mode 1)
  (run-at-time nil (* 5 60) 'recentf-save-list))

(use-package repeat
  :config
  (repeat-mode 1))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package standard-themes
  :if (and (member (system-name) '("WINDOWS")) (or window-system (daemonp)))
  :ensure t
  :config
  (load-theme 'standard-light :no-confirm))

(use-package simple
  :config
  (setq-default indent-tabs-mode nil)
  (column-number-mode 1))

(use-package startup
  :no-require
  :config
  (setq inhibit-startup-message t))

(use-package tab-bar
  :bind (("C-c <left>" . tab-bar-history-back)
         ("C-c <right>" . tab-bar-history-forward)
         :repeat-map tab-bar-repeat-map
         ("<left>" . tab-bar-history-back)
         ("<right>" . tab-bar-history-forward))
  :custom
  (tab-bar-show 1)
  :config
  (tab-bar-mode 1)
  (tab-bar-history-mode 1))

(use-package tex
  :ensure auctex
  :hook ((LaTeX-mode . turn-on-reftex)
         (LaTeX-mode . turn-on-cdlatex)
         (LaTeX-mode . prettify-symbols-mode)
         (LaTeX-mode . (lambda () (TeX-fold-mode 1)))
         (LaTeX-mode . (lambda () (set (make-local-variable 'TeX-electric-math)
					                   (cons "\\(" "\\)")))))
  :config
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)

  (setq LaTeX-electric-left-right-brace t))

(use-package vc
  :config
  (setq vc-follow-symlinks t))

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (vertico-sort-function #'vertico-sort-length-alpha)
  :config
  (vertico-mode 1))

(use-package vertico-mouse
  :after vertico
  :config
  (vertico-mouse-mode 1))

(use-package vertico-multiform
  :after vertico
  :config
  (vertico-multiform-mode 1))

(use-package which-key
  :ensure t
  :custom
  (which-key-show-early-on-C-h t)
  (which-key-idle-delay 10000)
  (which-key-idle-secondary-delay 0.05)
  :config
  (which-key-mode 1))

(use-package whitespace
  :bind (("<f6>" . whitespace-mode)
         ("C-c z" . delete-trailing-whitespace)))

(use-package window
  :bind ("M-o" . other-window))
