(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(setq custom-file (locate-user-emacs-file "custom.el"))

(setq initial-scratch-message "")
(setq inhibit-startup-message t)
(line-number-mode 1)
(column-number-mode 1)
(setq show-paren-style 0)
(show-paren-mode t)
(menu-bar-mode -99)
(global-auto-revert-mode 1)
(add-to-list 'exec-path "/usr/local/bin")
(setq-default show-trailing-whitespace t)

(global-set-key "\C-h" 'delete-backward-char)

(setq load-path (cons (expand-file-name "/usr/local/share/emacs/site-lisp") load-path))

;(global-linum-mode t)
;(setq linum-format "%5d ")

(require 'server)
(unless (server-running-p)
  (server-start))

(require 'tramp)
(setq tramp-default-method "ssh")

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(unless package-archive-contents
  (package-refresh-contents))
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

(use-package el-get)

(use-package ag
  :defer t
  :init
  (setq ag-highlight-search t)
  (setq ag-reuse-window 't))

(use-package anzu
  :defer t
  :init
  (custom-set-variables
   '(anzu-deactivate-region t)
   '(anzu-mode-lighter "")
   '(anzu-search-threshold 1000))
  (global-anzu-mode +1)
  :bind (("M-%" . anzu-query-replace)
	 ("C-M-%" . 'anzu-query-replace-regexp))
  :config
  (set-face-attribute 'anzu-mode-line nil
		      :foreground "black" :weight 'bold))

(use-package bundler)

(use-package company
  :diminish
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :custom
  (company-idle-delay 0 "")
  :bind (:map company-active-map
	      ("C-h" . nil)))

(use-package csharp-mode
  :no-require t
  :config
  (add-hook 'csharp-mode-hook
	    '(lambda ()
	       (setq indent-tabs-mode nil)
	       (setq c-basic-offset 4)))
  (modify-coding-system-alist 'file "\\.cs\\'" 'utf-8-with-signature-unix))

(use-package diminish)

(use-package elscreen
  :init
  (setq elscreen-prefix-key (kbd "C-c e"))
  (setq elscreen-tab-display-kill-screen nil)
  (setq elscreen-tab-display-control nil)
  (elscreen-start)
  :bind (("C-c 0" . elscreen-jump-0)
	 ("C-c 1" . elscreen-jump)
	 ("C-c 2" . elscreen-jump)
	 ("C-c 3" . elscreen-jump)
	 ("C-c 4" . elscreen-jump)
	 ("C-c 5" . elscreen-jump)
	 ("C-c 6" . elscreen-jump)
	 ("C-c 7" . elscreen-jump)
	 ("C-c 8" . elscreen-jump)
	 ("C-c 9" . elscreen-jump-9)))

(use-package enh-ruby-mode
  :custom
  (enh-ruby-add-encoding-comment-on-save nil "保存時にマジックコメントを追加しない")
  (enh-ruby-deep-indent-paren nil "かっこを複数行に書くときのインデントを深くしない")
  :mode (("\\.rb$" . enh-ruby-mode)
	 ("\\.rake\\'" . enh-ruby-mode)
	 ("Capfile\\'" . enh-ruby-mode)
	 ("Gemfile\\'" . enh-ruby-mode)
	 ("Rakefile\\'" . enh-ruby-mode)))

(use-package expand-region
  :bind ("C-," . er/expand-region))

(use-package flycheck
  :init
  (setq flycheck-check-syntax-automatically '(mode-enabled save idle-change))
  (setq flycheck-idle-change-delay 2))

(use-package git-gutter
  :diminish
  :config
  (global-git-gutter-mode))

(use-package helm
  :defer t
  :diminish
  :bind (("M-x" . helm-M-x)
	 ("C-x C-f" . helm-find-files)
	 ("C-x C-r" . helm-recentf)
	 ("C-x b" . helm-buffers-list)
	 ("M-m" . helm-imenu)
	 :map helm-map
	 ("C-h" . delete-backward-char)
	 :map helm-find-files-map
	 ("C-h" . delete-backward-char)
	 ("TAB" . helm-execute-persistent-action)
	 :map helm-read-file-map
	 ("TAB" . helm-execute-persistent-action))
  :config
  (helm-mode 1))

(use-package helm-ag
  :defer t
  :init
  (custom-set-variables
   '(helm-ag-base-command "rg --no-heading --vimgrep")
   '(helm-ag-insert-at-point 'symbol))
  :bind ("C-c s" . helm-ag-project-root))

(use-package helm-ghq
  :defer t)

(use-package helm-gtags
  :defer t
  :init
  (setq helm-gtags-auto-update t)
  (setq helm-gtags-ignore-case t)
  (setq helm-gtags-path-style (quote relative))
  :bind (:map helm-gtags-mode-map
	      ("M-t" . helm-gtags-find-tag)
	      ("M-r" . helm-gtags-find-rtag)
	      ("M-s" . helm-gtags-find-symbol)
	      ("M-g M-p" . helm-gtags-parse-file)
	      ("C-c <" . helm-gtags-previous-history)
	      ("C-c >" . helm-gtags-next-history)
	      ("M-," . helm-gtags-pop-stack)))

(use-package helm-migemo
  :disabled t)

(use-package helm-projectile
  :config
  (helm-projectile-on))

(use-package helm-swoop
  :defer t
  :bind (("M-s" . helm-swoop)
	 ("C-c M-s" . helm-multi-swoop)
	 ("C-x M-s" . helm-multi-swoop-all)
	 :map helm-swoop-map
	 ("C-r" . helm-previous-line)
	 ("C-s" . helm-next-line)))

(use-package highlight-symbol
  :defer t
  :diminish
  :hook (prog-mode . highlight-symbol-mode)
  :config
  (setq highlight-symbol-idle-delay 0.5))

(use-package loccur
  :bind ("C-o" . loccur-current))

(use-package lua-mode
  :no-require t
  :init
  (setq lua-indent-level 2))

(use-package lusty-explorer
  :disabled t
  :config
  (lusty-explorer-mode 1))

(use-package magit
  :defer t
  :bind ("C-c g" . magit-status)
  :config
  (set-face-attribute 'diff-added nil
		      :foreground "#00ff00"
		      :inherit 'default)
  (set-face-attribute 'diff-removed nil
		      :foreground "#ff0000"
		      :inherit 'default))

(use-package markdown-mode
  :no-require t)

(use-package migemo
  :defer t
  :init
  (setq migemo-command "cmigemo")
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  :config
  (migemo-init))

(use-package mwim
  :bind (("C-a" . mwim-beginning-of-code-or-line)
	 ("C-e" . mwim-end-of-code-or-line)))

(use-package omnisharp
  :bind (("M-." . omnisharp-auto-complete)
	 ("C-c d" . omnisharp-go-to-definition))
  :init
  (setq omnisharp-server-executable-path (expand-file-name "~/.ghq/github.com/OmniSharp/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")))

(use-package popwin
  :init
  (setq display-buffer-function 'popwin:display-buffer))

(use-package powerline
  :config
  (set-face-attribute 'mode-line nil
		      :foreground "#fff"
		      :background "#0000ff"
		      :box nil)
  (set-face-attribute 'powerline-active1 nil
		      :foreground "#000"
		      :background "#0066ff"
		      :inherit 'mode-line)
  (set-face-attribute 'powerline-active2 nil
		      :foreground "#000"
		      :background "#ccc"
		      :inherit 'mode-line)
  (powerline-default-theme))

(use-package projectile
  :diminish
  :init
  (projectile-global-mode))

(use-package projectile-rails
  :config
  (projectile-rails-global-mode))

(use-package rails-log-mode)

(use-package recentf-ext)

(use-package robe
  :diminish
  :init
  ;(add-hook 'enh-ruby-mode-hook 'robe-mode)
  (eval-after-load 'company
    '(push 'company-robe company-backends)))

(use-package rspec-mode
  :no-require t)

(el-get-bundle juszczakn/ruby-block)
(use-package ruby-block
  :diminish
  :init
  (setq ruby-block-highlight-toggle t)
  :config
  (ruby-block-mode t))

(use-package ruby-electric
  :no-require t
  :hook (enh-ruby-mode . ruby-electric-mode))

(use-package ruby-mode
  :no-require t
  :init
  (setq ruby-deep-indent-paren-style nil)
  :custom
  (ruby-insert-encoding-magic-comment nil "保存時にマジックコメントを追加しない")
  :mode (("\\.rake\\'" . ruby-mode)
	 ("Capfile\\'" . ruby-mode)
	 ("Gemfile\\'" . ruby-mode)
	 ("Rakefile\\'" . ruby-mode))
  :config
  (defadvice ruby-indent-line (after unindent-closing-paren activate)
    (let ((column (current-column))
	  indent offset)
      (save-excursion
	(back-to-indentation)
	(let ((state (syntax-ppss)))
	  (setq offset (- column (current-column)))
	  (when (and (eq (char-after) ?\))
		     (not (zerop (car state))))
	    (goto-char (cadr state))
	    (setq indent (current-indentation)))))
      (when indent
	(indent-line-to indent)
	(when (> offset 0) (forward-char offset))))))

(use-package sass-mode
  :no-require t)

(use-package scss-mode
  :no-require t)

(use-package slim-mode
  :no-require t)

(use-package smart-newline
  :bind ("C-m" . smart-newline))

(use-package ssh-config-mode
  :no-require t
  :mode (".ssh/config\\'" . ssh-config-mode))

(use-package swap-buffers)

(use-package terraform-mode)

(use-package volatile-highlights
  :diminish
  :config
  (volatile-highlights-mode t))

(use-package web-mode
  :no-require t
  :mode (("\\.html?\\'" . web-mode)))

(use-package which-key
  :diminish
  :config
  (which-key-mode 1))

(use-package yaml-mode
  :no-require t)

(use-package yasnippet
  :diminish yas-minor-mode
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (yas-global-mode 1))


;; ;;; http://bocchies.hatenablog.com/entry/2014/05/09/041130
;; ;(defun my-omnisharp-start (sln)
;; ;  (interactive "fOpen sln: ")
;; ;  (omnisharp-start-omnisharp-server (expand-file-name sln)))