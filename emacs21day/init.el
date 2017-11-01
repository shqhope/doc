
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
(tool-bar-mode -1)
(scroll-bar-mode t)
(electric-indent-mode -1)
(global-company-mode t)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq-default cursor-type 'bar)

(recentf-mode t)
