;;; packages.el --- blog layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: airead <airead@goyoo-2.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `blog-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `blog/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `blog/pre-init-PACKAGE' and/or
;;   `blog/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst blog-packages
  '(
    lentic
    org-webpage
    )
  )

(defun blog/init-org-webpage ()
  (use-package org-webpage
    :commands (owp/new-post owp/do-publication)
    :defer t
    :config
    (owp/add-project-config
     '("test project"
       :repository-directory "~/tmp/owp"
       ;; :remote (git "https://github.com/airead/tumashu.github.com.git" "master")
       ;; you can use `rclone` with `:remote (rclone "remote-name" "/remote/path/location")` instead.
       :site-domain "http://tumashu.github.com/"
       :site-main-title "Tumashu 的个人小站"
       :site-sub-title "(九天十地，太上忘情！！！)"
       :theme (worg)
       :source-browse-url ("Github" "https://github.com/tumashu/tumashu.github.com")
       :personal-avatar "/media/img/horse.jpg"
       ;; :personal-duoshuo-shortname "tumashu-website"
       :web-server-docroot "/tmp/owp/"
       :web-server-port 7654))
    )
  )


;;; packages.el ends here
