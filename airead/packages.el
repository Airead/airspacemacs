;;; packages.el --- %LAYER_NAME% layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: %USER_FULL_NAME% <%USER_MAIL_ADDRESS%>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;;; Code:

(defconst airead-packages
  '(
    multiple-cursors
    helm
    org
    flycheck
    )
  )

(defun airead/init-multiple-cursors ()
  "Config multiple-cursors."
  (use-package multiple-cursors
    :defer t
    :bind (("s-d" . mc/mark-next-like-this-symbol))
    ))

(defun airead/post-init-helm ()
  "Config helm."
  (global-set-key (kbd "s-r") 'helm-semantic-or-imenu)
  (global-set-key (kbd "s-p") 'helm-projectile-find-file))

(when (configuration-layer/layer-usedp 'org)
  (defun airead/pre-init-org ()
    (setq org-bullets-bullet-list '("■" "◆" "▲" "▶"))
    (setq org-agenda-files (list "~/Dropbox/gtd/notes.org"
                                 "~/Dropbox/gtd/inbox.org"))
    (setq org-default-notes-file "~/Dropbox/GTD/notes.org")
    (setq org-todo-keyword-faces
          '(("TODO" . "red")
            ("WAIT" . "yellow")))
    (setq org-clock-persist t))

  (defun airead/post-init-org ()
    (setq org-todo-keywords
          '((sequence "TODO(t)" "WAIT(w)" "|" "DONE(d)")))
    )
  )

(when (configuration-layer/layer-usedp 'syntax-checking)
  (defun airead/post-init-flycheck ()
    (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)))

(defun my-setup-indent (n)
  (interactive)
  ;; java/c/c++
  (setq-local c-basic-offset n)
  ;; web development
  (setq-local coffee-tab-width n) ; coffeescript
  (setq-local javascript-indent-level n) ; javascript-mode
  (setq-local js-indent-level n) ; js-mode
  (setq-local js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq-local web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq-local web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq-local web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq-local css-indent-offset n) ; css-mode
  )

(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))


;;; packages.el ends here
