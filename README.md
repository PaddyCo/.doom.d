# My doom emacs config

My personal doom emacs config

## Secrets

`secrets.el` contains stuff that should not be commited to a public repository, create a new one after cloning and fill in the following:

``` emacs-lisp
;; Org-gcal
(setq org-gcal-client-id "CLIENT_ID"
      org-gcal-client-secret "CLIENT_SECRET"
      org-gcal-fetch-file-alist '(("CALENDAR_ID" .  "~/Org/schedule.org")
                                  ;;("another-mail@gmail.com" .  "~/task.org")
                                  ))
```
