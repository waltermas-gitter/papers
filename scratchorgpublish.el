;; publishing papers
(require 'ox-publish)
(setq org-publish-project-alist
      '(
("org-notes"
 :base-directory "~/MEGAsync/papersorg/"
 :base-extension "org"
 :publishing-directory "~/MEGAsync/papersorg/docs/"
 :recursive t
 :publishing-function org-html-publish-to-html
 :headline-levels 4             ; Just the default for this project.
 :section-numbers nil
 :auto-preamble t
 :with-author t
 :with-toc nil
 )
("org-static"
 :base-directory "~/MEGAsync/papersorg/"
 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
 :publishing-directory "~/MEGAsync/papersorg/docs/"
 :recursive t
 :publishing-function org-publish-attachment
 )
("org" :components ("org-notes" "org-static"))
      ))
