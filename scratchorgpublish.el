;; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with C-x C-f and enter text in its buffer.

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
 :auto-preamble t
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
