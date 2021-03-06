;;; xt-misc.el --- Programming
;;
;; Copyright (c) 2016 Xitkov
;;

;;; Commentary:

;;; License:

;;; Code:


;; http://www.emacswiki.org/emacs/IndentingC
(setq c-default-style "linux"
      c-basic-offset 0)

;;; show the name of the current function definition in the modeline
(require 'which-func)

(setq which-func-unknown "n/a")

(which-function-mode 1)
;; Individual
;; (add-to-list 'which-func-modes 'ruby-mode)
;; (add-to-list 'which-func-modes 'emacs-lisp-mode)


;; https://github.com/bbatsov/emacs.d/blob/master/init.el
;; hippie expand is dabbrev expand on steroids
(setq hippie-expand-try-functions-list '(try-expand-dabbrev
                                         try-expand-dabbrev-all-buffers
                                         try-expand-dabbrev-from-kill
                                         try-complete-file-name-partially
                                         try-complete-file-name
                                         try-expand-all-abbrevs
                                         try-expand-list
                                         try-expand-line
                                         try-complete-lisp-symbol-partially
                                         try-complete-lisp-symbol))

;; use hippie-expand instead of dabbrev
(global-set-key (kbd "M-/") #'hippie-expand)
(global-set-key (kbd "s-/") #'hippie-expand)


;;; Rainbow Delimiters
(require-package 'rainbow-identifiers)
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)

;;; Rainbow delimiters
(require-package 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)


;;; Rainbow mode
(require-package 'rainbow-mode)
(rainbow-mode)


;;------------------------------------------------------------------------------
;; Multiple major modes
;;------------------------------------------------------------------------------

;;; Muti major modes
(require-package 'mmm-mode)
(require 'mmm-auto)

(setq mmm-global-mode 'buffers-with-submode-classes)
(setq mmm-submode-decoration-level 2)


;;; Neotree
(require-package 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Every time when the neotree window is opened, let it find current file and jump to node.
(setq neo-smart-open t)

;; When running ‘projectile-switch-project’ (C-c p p), ‘neotree’ will change root automatically.
;; (setq projectile-switch-project-action 'neotree-projectile-action)


;; Smart parens
;;;https://github.com/Fuco1/smartparens
(require-package 'smartparens)
(require 'smartparens-config)

(add-hook 'prog-mode-hook #'smartparens-mode)


;; Expand region
;;; https://github.com/atlefren/.emacs.d/blob/master/lisp/init-expand-region.el
(require-package 'expand-region)
(require 'expand-region)

(global-set-key (kbd "C-=") 'er/expand-region)


;;------------------------------------------------------------------------------
;; Git related
;;------------------------------------------------------------------------------

;; http://zeekat.nl/articles/making-emacs-work-for-me.html
(require-package 'magit)

;; (setq magit-default-tracking-name-function #'magit-default-tracking-name-branch-only)
;; (setq magit-last-seen-setup-instructions "1.4.0")

;; Put signoff message on commits
(setq magit-commit-signoff t)


;; https://github.com/syohex/emacs-git-gutter
(require-package 'git-gutter)

(setq git-gutter:ask-p nil)
(setq git-gutter:update-interval 5)

(global-git-gutter-mode +1)

(global-set-key (kbd "C-x v g") 'git-gutter:toggle)
(global-set-key (kbd "C-x v =") 'git-gutter:popup-hunk)

;; Jump to next/previous hunk
(global-set-key (kbd "C-x v p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x v n") 'git-gutter:next-hunk)

;; Stage current hunk
(global-set-key (kbd "C-x v s") 'git-gutter:stage-hunk)

;; Revert current hunk
(global-set-key (kbd "C-x v r") 'git-gutter:revert-hunk)

;; Mark current hunk
(global-set-key (kbd "C-x v SPC") #'git-gutter:mark-hunk)


(require-package 'git-timemachine)


;;------------------------------------------------------------------------------
;; Avy mode
;;------------------------------------------------------------------------------
;; https://github.com/abo-abo/avy

(require-package 'avy)

(avy-setup-default)

(global-set-key (kbd "C-;") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
;; (global-set-key (kbd "M-g g") 'avy-goto-line) ; Can replace M-g g
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)


;;------------------------------------------------------------------------------
;; Flycheck related
;;------------------------------------------------------------------------------
;; https://github.com/flycheck/flycheck
(require-package 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)


;;phpcs settings
;; (setq flycheck-php-phpcs-executable "/usr/local/bin/phpcs")
;; (setq flycheck-phpcs-standard (expand-file-name "~/.emacs.d/misc/lint/php/phpcs.xml"))

;;phpmd settings
;; (setq flycheck-php-phpmd-executable "/usr/local/bin/phpmd")
(setq flycheck-phpmd-rulesets '())
(add-to-list 'flycheck-phpmd-rulesets (expand-file-name "~/.emacs.d/misc/lint/php/phpmd.xml"))


;;------------------------------------------------------------------------------
;; Other
;;------------------------------------------------------------------------------

;;; highlight symbol
;; https://github.com/purcell/emacs.d/blob/41387d200fd496d9a96dd8dd0ee34e8b60e14555/lisp/init-editing-utils.el
(require-package 'highlight-symbol)

(dolist (hook '(prog-mode-hook html-mode-hook css-mode-hook))
  (add-hook hook 'highlight-symbol-mode)
  (add-hook hook 'highlight-symbol-nav-mode))

;;; Whitespace butler
(require-package 'ws-butler)

(add-hook 'prog-mode-hook 'ws-butler-mode)


;; https://github.com/pashky/restclient.el
(require-package 'restclient)


(require-package 'yasnippet)
(yas-global-mode 1)


;; (require-package 'guru-mode)
;; (add-hook 'prog-mode-hook 'guru-mode)
;; Globally
;; (guru-global-mode +1)
;; (setq guru-warn-only t)


;; Aggressive indent
(require-package 'aggressive-indent)

(add-hook 'emacs-lisp-mode-hook #'aggressive-indent-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
(add-hook 'css-mode-hook #'aggressive-indent-mode)

;; (global-aggressive-indent-mode 1)
;; (add-to-list 'aggressive-indent-excluded-modes 'html-mode)


(require-package 'imenu-anywhere)
(global-set-key (kbd "C-.") #'imenu-anywhere)


(require-package 'super-save)
(super-save-mode +1)

(setq super-save-auto-save-when-idle t)
(setq auto-save-default nil)


(require-package 'crux)
(require 'crux)

(global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
(global-set-key (kbd "C-c o") #'crux-open-with)
(global-set-key [(shift return)] #'crux-smart-open-line)
(global-set-key [remap kill-whole-line] #'crux-kill-whole-line)

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)


(provide 'init-programming)

;;; init-programming.el ends here
