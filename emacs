;(scroll-bar-mode -1);; no scroll bar
;; 一些基本的设置,不包含一些快捷键的绑定
(tool-bar-mode -1);; no tool bar
(set-default-font "Courier New-15");;设置字体
(setq confirm-kill-emacs 'yes-or-no-p);; ask when killing emacs
(setq track-eol t);; keep cursor at the end of line
(setq transient-mark-mode t);; highlight marked region
(global-hl-line-mode t);; hightlignt current line
(setq mouse-yank-at-point t);; yank to point rather than cursor
(setq x-select-enable-clipboard t);; enable x clipboard
(setq visible-bell t);; disable beep
(setq inhibit-startup-message t);; no startup message
(setq initial-scratch-message nil);; empty scratch
(fset 'yes-or-no-p 'y-or-n-p);; simplify yes or no
(setq kill-ring-max 1024);; set the capacity of kill-ring to 1024
(setq mark-ring-max 1024);; mark ring compacity
(setq global-mark-ring-max 1024);; max global mark ring comapcity
(setq message-log-max t);; message logs all information
(setq-default fill-column 80);; set column width
(setq-default comment-column 80)

;; tab settings
(setq-default indent-tabs-mode t) ; tab using real tab
(setq default-tab-width 4) ; default tab width
(setq x-stretch-cursor t);; highlight tab using stretch cursor
(setq whitespace-global-mode t);; detect whitespace
(setq require-final-newline nil);; don't insert a newline before saving
(setq enable-recursive-minibuffers t);; enable recursive-minibuffers
(setq history-delete-duplicates t);; no duplicated histories in minibuffer

;; show parentheses match but no jump
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(electric-pair-mode t) ;; 自动补全括号

;; mode-line
(display-time-mode 1)
(setq display-time-12hr-format t)
(setq display-time-day-and-date t)
(setq line-number-mode t)
(setq column-number-mode t)

;; set mouse wheel step
(setq mouse-wheel-scroll-amount `(3))
(setq mouse-wheel-progressive-speed nil)

;; font-lock
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq font-lock-maximum-size nil)

(setq-default comment-style 'indent);; auto indent for comment

;; auto reload
(global-auto-revert-mode)

;; enable open graphic files
(auto-image-file-mode 1)

;; display line number
(if (>= emacs-major-version 22)
	(progn
	  (require 'linum)
	  (global-linum-mode t)))

;; disable suspend if window system
(if window-system
(global-unset-key (kbd "C-z")))


;; -------------------------------------------
;; TIME-STAMP
;; when there is a "Time-stamp: <>" in the first 10 lines of the file,
;; emacs will write time-stamp information there when saving the file.
;; -------------------------------------------
;; (setq time-stamp-active t) ; do enable time-stamps
;; (setq time-stamp-line-limit 10) ; check first 10 buffer lines for Time-stamp: <>
;; (setq time-stamp-format "Last modified y-m-d H:M:S by %L") ; date format 
;; (add-hook 'before-save-hook 'time-stamp) ; update when saving


;;---------------------------------------------------------
;; 插件管理
;;---------------------------------------------------------
;; emacs 使用 melpa 进行插件的安装
;; M-x package-refresh-contents 刷新package信息
;; M-x package-install 安装插件
;; M-x package-list 列出可以安装的插件列表
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa"						.	"https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu"	.	"http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;---------------------------------------------------------
;; 安装包的时候自动添加的
;;---------------------------------------------------------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
	(neotree color-theme ac-html ac-js2 smex helm auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;----------------------------------------------------------
;; 开启插件
;;----------------------------------------------------------
;; helm
;(add-to-list "load-path "/Users/dai/		.	emacs.d/elpa/helm-20170101.239")
(require 'helm-config)
(helm-mode 1)

;; 开启 auto complete
;(add-to-list "load-path "/Users/dai/		.	emacs.d/elpa/auto-complete-20161029.643")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

;; 开启 smex
;(add-to-list "load-path "/Users/dai/		.	emacs.d/elpa/smex-20151212.1409")
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command);; This is your old M-x.

;; 开启 color-theme
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-sitaramv-solaris)

;; 开启 neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)


;;----------------------------------------------------------
;; 自定义实现的方法
;;----------------------------------------------------------
;; 1.如果没有选中区域, M-w就是复制一行 C-w就是剪切一行
;; copy region or whole line(global-set-key "\M-w"
(global-set-key "\M-w"
(lambda ()
  (interactive)
  (if mark-active
      (kill-ring-save (region-beginning)
      (region-end))
    (progn
     (kill-ring-save (line-beginning-position)
     (line-end-position))
     (message "copied line")))))


;; kill region or whole line
(global-set-key "\C-w"
(lambda ()
  (interactive)
  (if mark-active
      (kill-region (region-beginning)
   (region-end))
    (progn
     (kill-region (line-beginning-position)
  (line-end-position))
     (message "killed line")))))


;; 2.自动格式化代码,并绑定到F7
(defun indent-whole()
"Indent the whole buffer."
(interactive)
(save-excursion
  (indent-region (point-min) (point-max) nil)
  ))

;; 绑定到F7
(global-set-key [f7] 'indent-whole)



;;==================================================
;; 绑定的一些快捷键
;;==================================================
;; move between windows
(global-set-key (kbd "<M-left>") 'windmove-left)
(global-set-key (kbd "<M-right>") 'windmove-right)
(global-set-key (kbd "<M-up>") 'windmove-up)
(global-set-key (kbd "<M-down>") 'windmove-down)
(global-set-key (kbd "C-x 9") 'kill-buffer-and-window);; kill buffer and its window
(global-set-key (kbd "C-c g") 'goto-line) ;; goto line
(global-set-key (kbd "C-M-'") 'align-entire);; align region
;; F7 自动格式化代码
;; M-w 复制 C-w 剪切
;; F8 开启neotree 文件管理器
;; C-y 粘贴
;; C-g 放弃命令
;; C-s 搜索 C-r向上搜索,C-s向下搜索
;; C-a 行首 C-e 行尾
;; M-; 注释
;; C-S-@  Mark-Set
