(setq org-publish-project-alist
      '(("org"
         :base-directory "~/Dropbox/org/"
         :publishing-directory "/tmp/org_publish"
         :publishing-function org-html-publish-to-html
         :section-numbers nil
         :with-toc nil
         :html-head "<link rel=\"stylesheet\"
                         href=\"style.css\"
                         type=\"text/css\"/>")
        ("org-other"
         :base-directory "/tmp/test/org/"
         :base-extension "css\\|png"
         :publishing-directory "/tmp/test/public_html"
         :publishing-function org-publish-attachment
         :section-numbers nil
         :with-toc nil
         :html-head "<link rel=\"stylesheet\"
                         href=\"style.css\"
                         type=\"text/css\"/>")
        ("website" :components ("org" "org-other"))))

(provide 'org-projects)
