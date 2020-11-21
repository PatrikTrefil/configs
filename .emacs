;Credits to this guy https://github.com/aaronbieber/dotfiles/blob/master/configs/emacs.d/init.el


;(set
 ;-default
 ;mouse-wheel-follow-mouse t          ; Mouse-wheel acts on the hovered window instead of where the typing focus is
 ;echo-keystrokes 0.1                 ; Let emacs react faster to keystrokes
 ;confirm-kill-emacs 'y-or-n-p        ; Confirm before quitting
 ;ring-bell-function 'ignore          ; Disable anoying beep
 ;redisplay-dont-pause t              ; Improve rendering performance
 ;indicate-empty-lines t              ; Display a special glyph in the fringe of each empty line at the end of the buffer
 ;help-window-select t                ; Jump to the help window when it's opened.
 ;right-margin-width 1
 ;uniquify-buffer-name-style 'forward ; Better unique buffer names
 ;window-combination-resize t         ; Resize windows proportionally
 ;x-stretch-cursor t)                 ; Stretch cursor to the glyph width
(fset 'yes-or-no-p 'y-or-n-p)        ; Simpler y/n answers
(setenv "DICTIONARY" "en_GB")
(setq ispell-dictionary "english")
(setq locale-coding-system   'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(set-language-environment    "UTF-8")
(prefer-coding-system        'utf-8)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default indent-tabs-mode nil)
;(column-number-mode t)
(setq-default tab-width 2)
(setq-default indicate-empty-lines t)
(setq vc-follow-symlinks t)
(setq backup-directory-alist `(("." . "~/.cache/emacs")))

;(add-to-list 'load-path "~/.emacs.d/vendor/emacs-powerline")
;(require 'powerline)
;(setq powerline-arrow-shape 'arrow14)

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  )
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("855eb24c0ea67e3b64d5d07730b96908bac6f4cd1e5a5986493cbac45e9d9636" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(js-indent-level 2)
 ;'(minibuffer-complete-cycle t nil (minibuffer-complete-cycle))
 '(package-selected-packages
   (quote
    (org-evil minibuffer-complete-cycle js2-mode airline-themes smart-mode-line-atom-one-dark-theme smart-mode-line all-the-icons-dired all-the-icons use-package avy-flycheck dracula-theme linum-relative ## org-roam markdown-mode powerline-evil monokai-theme evil))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(minibuffer-complete-cycle ((t (:inherit secondary-selection :weight bold)))))
(require 'airline-themes)
(load-theme 'airline-onedark t)

(eval-when-compile
  (require 'use-package))

(use-package all-the-icons
  :ensure t
  :defer t)

(use-package all-the-icons-dired
  :ensure t
  :defer t)

(use-package yasnippet
  :ensure t
  :defer t
  :config
  ;;(yas-reload-all)
  (setq tab-always-indent 'complete)
  (define-key yas-minor-mode-map (kbd "<escape>") 'yas-exit-snippet))

(use-package yasnippet-snippets
  :ensure t
  :defer t)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;(use-package smart-mode-line
;  :ensure t
;  :config
;  (setq sml/theme 'atom-one-dark)
;  (sml/setup))

(require 'evil)
(evil-mode 1)
;(require 'linum-relative)
;(linum-relative-global-mode 1)
;(setq linum-relative-current-symbol "")
(if (functionp 'display-line-numbers-mode)
    (and (add-hook 'display-line-numbers-mode-hook
                   (lambda () (setq display-line-numbers-type 'relative)))
         (add-hook 'prog-mode-hook #'display-line-numbers-mode))
  (use-package nlinum-relative
    :ensure t
    :config
    (nlinum-relative-setup-evil)
    (setq nlinum-relative-redisplay-delay 0)
    (add-hook 'prog-mode-hook #'nlinum-relative-mode)))
;;(load-theme 'monokai t)
(load-theme 'dracula t)
(set-frame-font "Droid Sans 19" nil t)
;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(use-package org
  :config
  (setq org-startup-indented t))

  (add-hook 'org-mode-hook (lambda ()
			   (visual-line-mode t)
			   (set-fill-column 80)
                           (yas-minor-mode)
                           (flyspell-mode)))
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

;; Roam
(use-package org-roam
      :hook
      (after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/Mega/Documents/Other/org")
      (org-roam-buffer-width 0.4)
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert))))

(tool-bar-mode -1)
(toggle-frame-maximized)
(use-package markdown-mode
  :ensure t
  :mode "\\.md\\'"
  :config
  (setq markdown-command "pandoc --from markdown_github-hard_line_breaks --to html")

  (add-hook 'markdown-mode-hook (lambda ()
                                  (visual-line-mode t)
                                  (set-fill-column 80))))
                                  ;;(yas-minor-mode-on)
                                  ;;(flyspell-mode))))
