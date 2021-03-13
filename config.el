;;; .doom.d/config.el -*- lexical-binding: t; -*-
(load-file (concat doom-private-dir "secrets.el"))

(setq
 projectile-project-search-path '(getenv "MAIN_PROJECT_DIR")
)

;; Default input method
(setq default-input-method "swedish-keyboard")

;; Set doom theme
(setq doom-theme 'doom-dracula)

;; Org
(setq org-agenda-start-on-weekday 1) ; Start on Monday!
(setq org-directory "~/Org")
(setq org-log-into-drawer "LOGBOOK")
(setq org-stuck-projects '("+PROJECT/-CANCELLED-DONE" ("TODO" "NEXT" "WAITING") nil ""))
(setq org-modules '(ol-bibtex org-habit))
(setq org-log-reschedule 'time)

(load-file (concat doom-private-dir "sv-kalender.el"))

(setq org-agenda-custom-commands
      (quote
       (("p" "Personal Agenda and NEXT tasks"
         ((agenda ""
                  ((org-agenda-overriding-header "Personal Agenda")
                   (org-agenda-start-day "+0d")
                   (org-agenda-span 3)))
          (tags-todo "TODO=\"NEXT\""
                     ((org-agenda-overriding-header "NEXT tasks"))))
         ((org-agenda-category-filter-preset '("+Personal" "+Dates"))))
        ("w" "Work Agenda and NEXT tasks"
         ((agenda ""
                  ((org-agenda-overriding-header "Work Agenda")
                   (org-agenda-start-day "+0d")
                   (org-agenda-span 3)))
          (tags-todo "TODO=\"NEXT\""
                     ((org-agenda-overriding-header "NEXT tasks"))))
         ((org-agenda-category-filter-preset '("+Work"))))
        )))
(after! org
  (setq org-capture-templates
        `(("p" "Private templates")
          ("pi" "Inbox entry" entry
           (file "~/Org/inbox.org")
           (file "~/Org/templates/inbox.tpl.txt"))
          ("pd" "Daily entry" checkitem
           (file+olp+datetree "~/Org/daily.org")
           (file "~/Org/templates/daily.tpl.txt"))
          ("w" "Work templates")
          ("wi" "Inbox entry" entry
           (file "~/Org/work-inbox.org")
           (file "~/Org/templates/inbox.tpl.txt"))
          ("wd" "Daily entry" checkitem
           (file+olp+datetree "~/Org/work-daily.org")
           (file "~/Org/templates/daily.tpl.txt"))
          )
        )
  )

;; Deft
(setq deft-directory "~/Org/Notes")
(setq org-attach-id-dir "~/Org/.attach")

;; Hate 'em
(after! smartparens
  (smartparens-global-mode -1))

;; Support for nunjucks
(add-to-list 'auto-mode-alist '("\\.njk\\'" . web-mode))

;; Minimum characters before starting to search using ivy
(setq ivy-more-chars-alist
      '((counsel-grep . 2)
        (counsel-rg . 3)
        (counsel-search . 2)
        (t . 3)))

;; if running Emacs inside a X server on windows, make sure it opens websites in the Windows web browser or it will crash the X server
(setq-default sysTypeSpecific  system-type) ;; get the system-type value
(cond
 ;; If type is "gnu/linux", override to "wsl/linux" if it's WSL.
 ((eq sysTypeSpecific 'gnu/linux)
  (when (string-match "Linux.*Microsoft.*Linux"
                      (shell-command-to-string "uname -a"))

    (setq-default sysTypeSpecific "wsl/linux") ;; for later use.
    (setq
     cmdExeBin"/mnt/c/Windows/System32/cmd.exe"
     cmdExeArgs '("/c" "start" "") )
    (setq
     browse-url-generic-program  cmdExeBin
     browse-url-generic-args     cmdExeArgs
     browse-url-browser-function 'browse-url-generic)
    )))

;; set Omnisharp path
(setq omnisharp-server-executable-path "/var/opt/omnisharp/run")
