(setq custom-file "~/.emacs.d/custom.el")

(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'backup-directory-alist '("." . ".~"))
(add-to-list 'load-path "~/.emacs.d/local/")

(require 'use-package)
(use-package gruber-darker-theme :ensure t :demand t)
;; (use-package dirvish :ensure t :demand t :pin melpa-stable)
;; https://jblevins.org/projects/markdown-mode/
(use-package markdown-mode :ensure t :demand t :pin nongnu)
;; https://immerrr.github.io/lua-mode/
(use-package lua-mode :ensure t :demand t :pin nongnu)
(use-package json-mode :ensure t :demand t :pin melpa-stable)
(use-package yaml-mode :ensure t :demand t :pin melpa-stable)
(use-package yaml-imenu :ensure t :demand t :after yaml-mode :pin melpa-stable)
(use-package typescript-mode :ensure t :demand t :pin nongnu)

;; (use-package docker-compose-mode :ensure t :demand t :pin melpa-stable)

;;; dirvish Setting
;; (dirvish-override-dired-mode 1)
;; (require 'dirvish-collapse)
;; (require 'dirvish-subtree)
;; (require 'dirvish-vc)
;; (require 'dirvish-icons)
;; (require 'dirvish-side)
;; (setq dirvish-attributes
;;       (append
;;        ;; The order of these attributes is insignificant, they are always
;;        ;; displayed in the same position.
;;        '(vc-state subtree-state nerd-icon collapse)
;;        ;; Other attributes are displayed in the order they appear in this list.
;;        '(git-msg file-modes file-time file-size)))



;;; json-mode Setting
(add-to-list 'auto-mode-alist '("\\.jsonc\\'" . json-mode))

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; (add-to-list 'default-frame-alist
;; 	     '(font . "Iosevka"))

;; (set-frame-font (font-spec :family "JetBrains Mono" :height 180))

(set-face-attribute 'default nil
		    :family "JetBrainsMonoNL NFM"
		    :height 180)

;;; 指定每个字符集的所用字体
;; 统一设置为LXGW WenKai Mono
(dolist (charset '(kana han cjk-misc bopomofo))
  (set-fontset-font t charset (font-spec :family "LXGW WenKai Mono"))
  )
;; 分别设置
;; (set-fontset-font t 'han        (font-spec :family "Noto Sans Mono CJK SC"))
;; (set-fontset-font t 'kana       (font-spec :family "Noto Sans Mono CJK JP"))
;; (set-fontset-font t 'bopomofo   (font-spec :family "Noto Sans Mono CJK TC"))
;; (set-fontset-font t 'cjk-misc   (font-spec :family "Noto Sans Mono CJK SC"))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode 1)
(ido-everywhere 1)
(global-display-line-numbers-mode)

(global-set-key (kbd "C-x ,") 'duplicate-line)

;;; Markdown-mode
;; always open the preview window at the right
(setq markdown-split-window-direction 'right)
;; delete exported HTML file after markdown-live-preview-export is called
(setq markdown-live-preview-delete-export 'delete-on-export)

;; 重写复制粘贴
;; 仅在Wayland终端模式下启用
(when (and (not (display-graphic-p))
           (getenv "WAYLAND_DISPLAY"))
  ;; 使用 wl-copy 和 wl-paste
  (setq interprogram-cut-function
	(lambda (text)
          (let ((process-connection-type nil))
            (start-process "wl-copy" nil "wl-copy" text))))

  (setq interprogram-paste-function
	(lambda ()
          (shell-command-to-string "wl-paste --no-newline"))))

(load custom-file)
