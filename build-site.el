;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)


;; Define the publishing project
(require 'ox-publish)
;; Customize the HTML output
(setq org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      ;; org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />
      ;; org-html-head "
;; <link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />
;; <link rel=\"icon\" type=\"image/x-icon\" href=\"/favicon.ico\">")

      org-html-head "
<link rel='stylesheet' href='https://cdn.simplecss.org/simple.min.css' />
<link rel='icon' type='image/x-icon' href='/img/favicon_io/favicon.ico'>
<link rel='apple-touch-icon' sizes='180x180' href='/img/favicon_io/apple-touch-icon.png'>
<link rel='icon' type='image/png' sizes='32x32' href='/img/favicon_io/favicon-32x32.png'>
<link rel='icon' type='image/png' sizes='16x16' href='/img/favicon_io/favicon-16x16.png'>
<link rel=imanifest' href='/img/favicon_io/site.webmanifest'>
")


(setq org-publish-project-alist
      (list
       (list "my-org-site"
             :recursive t
             :with-toc nil                ;; Include a table of contents
             :section-numbers nil
             :base-directory "/home/waltermas/MEGAsync/papersorg/contents"
             :publishing-directory "/home/waltermas/MEGAsync/papersorg/docs"
             :publishing-function 'org-html-publish-to-html)
       (list "org-static"
             :base-directory "/home/waltermas/MEGAsync/papersorg/contents"
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|ico\\|txt"
             :publishing-directory "/home/waltermas/MEGAsync/papersorg/docs"
             :recursive t
             :publishing-function 'org-publish-attachment
 )
       ))

;; Generate the site output
(org-publish-all t)
;; (org-publish-project t)


(message "Build complete!")
