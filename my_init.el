(prelude-require-packages '(visual-fill-column
                            clj-refactor deft
                            ;leuven-theme
                            ;dired-sidebar
                            ;all-the-icons-dired
                            ;magit-gh-pulls
                            ;slime
                            xml-rpc
                            metaweblog
                            ;htmlize
                            ;terraform-mode
                            ;dockerfile-mode
                            puppet-mode
                            counsel-projectile
                            ;company-terraform
                            company-shell
                            ag
                            ;leuven-theme
                            ;;ob-async
                            ;fold-dwim
                            ;fold-dwim-org
                            ;org2blog
                            ;deft
                            ;all-the-icons
                            ;all-the-icons-dired
                            ;;all-the-icons-ivy
                            ;;doom-themes
                            ;;leuven-theme
                            ;pivotal-tracker
                            ;;org-gcal
                            ;;unicode-fonts
                            ;browse-at-remote
                            ;;calfw
                            ;;calfw-org
                            ;smart-mode-line
                            ;;smart-mode-line-powerline-theme
                            neotree
                            ;pinentry
                            ;;twittering-mode
                            ;mustache-mode
                            ;ipcalc
                            ;ob-async
                            pyvenv
                            ;ein
                            ;nyan-mode

                            ))


;;make arrows work in tmate
(defadvice terminal-init-screen
    ;; The advice is named `tmux', and is run before `terminal-init-screen' runs.
    (before tmux activate)
  ;; Docstring.  This describes the advice and is made available inside emacs;
  ;; for example when doing C-h f terminal-init-screen RET
  "Apply xterm keymap, allowing use of keys passed through tmux."
  ;; This is the elisp code that is run before `terminal-init-screen'.
  (if (getenv "TMUX")
      (let ((map (copy-keymap xterm-function-map)))
        (set-keymap-parent map (keymap-parent input-decode-map))
        (set-keymap-parent input-decode-map map))))

;; theme
(load-theme 'zenburn t)

;; turn on modes
(diff-hl-margin-mode 1)
(diff-hl-flydiff-mode 1)

;; rainbow brackets
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; font
(set-face-attribute 'default nil
                    :family "Inconsolata" :height 145 :weight 'bold)

;; clojure
(require 'flycheck-joker)
(setq cljr-warn-on-eval nil)

;; python
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt -i")
(pyvenv-tracking-mode 1)
;(require 'flymake-python-pyflakes)
;(add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
;(setq flymake-python-pyflakes-executable "flake8")


;turn off some prelude stuff
(setq prelude-guru nil)
(setq prelude-whitespace nil)

;set backup dir
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))

;;delete to trash
(when (eq system-type 'darwin)
  (osx-trash-setup))
(setq delete-by-moving-to-trash t)

;; key  bindings
(global-set-key (kbd "C-x C-r") 'recentf-open-files)
(global-set-key (kbd "C-c [") 'diff-hl-revert-hunk)


(defun dired-mode-key-bindings-hook ()
  (local-set-key (kbd "C-x <up>") 'dired-up-directory)
  (local-set-key (kbd "C-x C-<up>") 'dired-up-directory)
  (local-set-key (kbd ".") 'dired-hide-dotfiles-mode)
  (local-set-key (kbd "C-<up>") (kbd "C-u 10 <up>"))
  (local-set-key (kbd "C-<down>") (kbd "C-u 10 <down>")))

(add-hook 'dired-mode-hook 'dired-mode-key-bindings-hook)
