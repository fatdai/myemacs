;; -------------------------------------------
;; BASIC SETTINGS
;; -------------------------------------------

;;load path
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
(when (file-exists-p default-directory)
(add-to-list 'load-path default-directory)
(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
(normal-top-level-add-subdirs-to-load-path))))


;; encoding
(setq default-buffer-file-coding-system 'utf-8-unix) ; buffer file
(setq default-file-name-coding-system 'utf-8-unix) ; file name
(setq default-keyboard-coding-system 'utf-8-unix) ; keyboard input
(setq default-process-coding-system '(utf-8-unix . utf-8-unix)) ; process input/output
(setq default-sendmail-coding-system 'utf-8-unix) ; email
(setq default-terminal-coding-system 'utf-8-unix) ; terminal

;; theme
;(if window-system
;(progn
;(require 'color-theme)
;(color-theme-initialize)
;(color-theme-calm-forest)))
 
(if (not window-system)
(progn
(set-face-foreground 'default "gray")
(set-face-background 'default "black")))

;; no scroll bar
(scroll-bar-mode -1)
 
;; no tool bar
(tool-bar-mode -1)
 
;; ask when killing emacs
(setq confirm-kill-emacs 'yes-or-no-p)
 
;; keep cursor at the end of line
(setq track-eol t)
 
;; highlight marked region
(setq transient-mark-mode t)
 
;; hightlignt current line
(global-hl-line-mode t)
 
;; yank to point rather than cursor
(setq mouse-yank-at-point t)
 
;; enable x clipboard
(setq x-select-enable-clipboard t)
 
;; disable beep
(setq visible-bell t)
 
;; no startup message
;;(setq inhibit-startup-message t)
 
;; empty scratch
(setq initial-scratch-message nil)

;; simplify yes or no
(fset 'yes-or-no-p 'y-or-n-p)
 
;; set the capacity of kill-ring to 1024
(setq kill-ring-max 1024)
 
;; mark ring compacity
(setq mark-ring-max 1024)
 
;; max global mark ring comapcity
(setq global-mark-ring-max 1024)
 
;; message logs all information
(setq message-log-max t)
 
;; set column width
(setq-default fill-column 80)
(setq-default comment-column 80)
 
;; tab settings
(setq-default indent-tabs-mode t) ; tab using real tab
(setq default-tab-width 4) ; default tab width
(dolist (hook (list ; tab using whitespace in these mode
'emacs-lisp-mode-hook
'lisp-mode-hook
'lisp-interaction-mode-hook
'scheme-mode-hook
'c-mode-hook
'c++-mode-hook
'java-mode-hook
'haskell-mode-hook
'asm-mode-hook
'emms-tag-editor-mode-hook
'sh-mode-hook
'haskell-cabal-mode-hook
))
(add-hook hook '(lambda () (setq indent-tabs-mode nil))))


;; highlight tab using stretch cursor
(setq x-stretch-cursor t)
 
;; detect whitespace
(setq whitespace-global-mode t)
 
;; don't insert a newline before saving
(setq require-final-newline nil)
 
;; enable recursive-minibuffers
(setq enable-recursive-minibuffers t)
 
;; no duplicated histories in minibuffer
(setq history-delete-duplicates t)
 
;; show parentheses match but no jump
(show-paren-mode t)
(setq show-paren-style 'parentheses)
 
;; mode-line
(display-time-mode 1)
(setq display-time-12hr-format t)
(setq display-time-day-and-date t)
 
(setq line-number-mode t)
(setq column-number-mode t)
 
;; frame title
(setq frame-title-format
'("%S" (buffer-file-name "%f - GNU Emacs"
(dired-directory dired-directory "%b"))))
 
;; auto reload
(global-auto-revert-mode)
 
;; enable open graphic files
(auto-image-file-mode 1)

;; isearch
(setq-default case-fold-search nil) ; make searches case-sensitive by default
(setq query-replace-highlight t) ; highlight during query
(setq search-highlight t) ; highlight incremental search
(setq isearch-allow-scroll t) ; scroll isearch
(define-key isearch-mode-map (kbd "TAB") 'isearch-complete) ; isearch complete
(define-key isearch-mode-map (kbd "<M-p>") 'isearch-ring-retreat) ; backword search in history
(define-key isearch-mode-map (kbd "<M-n>") 'isearch-ring-adjust) ; forward search in history
(define-key isearch-mode-map (kbd "<C-g>") 'isearch-abort) ; abort search
(define-key isearch-mode-map (kbd "<C-w>") 'isearch-yank-word-or-char) ; search current word
(define-key isearch-mode-map (kbd "<M-y>") 'isearch-yank-kill) ; search the last item in the kill ring
(define-key isearch-mode-map (kbd "<M-c>") 'isearch-toggle-case-fold) ; switch case-fold
 
 
;; backup the oldest two versions and the most-recent five versions
(setq version-control t) ; Use version numbers for backups
(setq kept-old-versions 2) ; Number of oldest versions to keep
(setq kept-new-versions 5) ; Number of newest versions to keep
(setq delete-old-versions t) ; Delete too old versions
(setq dired-kept-versions 1)
(setq backup-directory-alist '(("." . "~/.emacs.d/emacs-backup")))
(setq backup-by-copying t)
(setq backup-by-copying-when-linked t) ; Copy linked files, don't rename.
(setq backup-by-copying-when-mismatch t)
 
;; display line number
(if (>= emacs-major-version 22)
(progn
(require 'linum)
(global-linum-mode t)))

;; set mouse wheel step
(setq mouse-wheel-scroll-amount `(3))
(setq mouse-wheel-progressive-speed nil)
 
;; font-lock
(global-font-lock-mode t)
(setq font-lock-maximum-decoration t)
(setq font-lock-maximum-size nil)
 
;; auto indent for comment
(setq-default comment-style 'indent)
 
;; move between windows
(global-set-key (kbd "<C-left>") 'windmove-left)
(global-set-key (kbd "<C-right>") 'windmove-right)
(global-set-key (kbd "<C-up>") 'windmove-up)
(global-set-key (kbd "<C-down>") 'windmove-down)
 
;; disable suspend if window system
(if window-system
(global-unset-key (kbd "C-z")))
 
;; kill buffer and its window
(global-set-key (kbd "C-x 9") 'kill-buffer-and-window)

;; goto line
(global-set-key (kbd "C-c g") 'goto-line)
 
;; align region
(global-set-key (kbd "C-M-'") 'align-entire)

;; -------------------------------------------
;; TIME-STAMP
;; when there is a "Time-stamp: <>" in the first 10 lines of the file,
;; emacs will write time-stamp information there when saving the file.
;; -------------------------------------------
(setq time-stamp-active t) ; do enable time-stamps
(setq time-stamp-line-limit 10) ; check first 10 buffer lines for Time-stamp: <>
(setq time-stamp-format "Last modified y-m-d H:M:S by %L") ; date format
 
(add-hook 'before-save-hook 'time-stamp) ; update when saving


;; -------------------------------------------
;; POINT STACK
;; Provides forward/back stack for point.
;; https://github.com/cofi/dotfiles/blob/master/elisp/point-stack.el
;; -------------------------------------------
(defvar point-stack-stack nil)
;; after you pop put it on the forward stack
(defvar point-stack-forward-stack nil)
 
(defun point-stack-push ()
"Push current location and buffer info onto stack."
(interactive)
(message "Location marked.")
(setq point-stack-stack (cons (list (current-buffer) (point)) point-stack-stack)))
 
(defun point-stack-pop ()
"Pop a location off the stack and move to buffer"
(interactive)
(if (null point-stack-stack)
(message "Stack is empty.")
(setq point-stack-forward-stack (cons (list (current-buffer) (point)) point-stack-forward-stack))
(switch-to-buffer (caar point-stack-stack))
(goto-char (cadar point-stack-stack))
(setq point-stack-stack (cdr point-stack-stack))))
 
(defun point-stack-forward-stack-pop ()
"Pop a location off the stack and move to buffer"
(interactive)
(if (null point-stack-forward-stack)
(message "forward Stack is empty.")
(setq point-stack-stack (cons (list (current-buffer) (point)) point-stack-stack))
(switch-to-buffer (caar point-stack-forward-stack))
(goto-char (cadar point-stack-forward-stack))
(setq point-stack-forward-stack (cdr point-stack-forward-stack))))

(global-set-key (kbd "C-c -") 'point-stack-push)
(global-set-key (kbd "C-c =") 'point-stack-pop)
(global-set-key (kbd "C-c /") 'point-stack-forward-stack-pop)

;; -------------------------------------------
;; TEXT-MODE
;; -------------------------------------------
;; set default mode to text-mode
(setq-default major-mode 'text-mode)
 
(defun text-mode-hook-func ()
(flyspell-mode t)
(turn-on-auto-fill)
(setq indent-line-function 'insert-tab)) ; insert tab or complete in text mode
 
(add-hook 'text-mode-hook 'text-mode-hook-func)
 
;; -------------------------------------------
;; COMPILATION-MODE
;; -------------------------------------------
;; compilation preferences
(setq compilation-scroll-output t)
(setq compile-auto-highlight t)
 
;; compilation buffer split vertically
(defadvice compile (around split-vertically activate)
(let ((split-width-threshold nil)
(split-height-threshold 0))
ad-do-it))


;; -------------------------------------------
;; AUTO FORMAT COPIED CONTENTS
;; -------------------------------------------
(defadvice yank (after indent-region activate)
"To make yank content indent automatically"
(if (member major-mode '(emacs-lisp-mode
scheme-mode
lisp-mode
lisp-interaction-mode
c-mode
c++-mode
objc-mode
java-mode
latex-mode
plain-tex-mode))
(indent-region (region-beginning) (region-end) nil)))


;; -------------------------------------------
;; INDENT OR COMPLETE
;; Smart choice between indent and complete
;; -------------------------------------------
(defun indent-or-complete ()
"Complete if point is at end of a word, otherwise indent line."
(interactive)
(if (looking-at "\\>")
(dabbrev-expand nil)
(indent-for-tab-command)))
 
;; Hippie
(autoload 'senator-try-expand-semantic "senator")
 
;; Hippie expand try search priority
(setq hippie-expand-try-functions-list
'(
senator-try-expand-semantic ; senator analysis
try-expand-dabbrev-visible ; dabbrev, visible window
try-expand-dabbrev ; dabbrev
try-expand-dabbrev-all-buffers ; dabbrev, all windows except for the visible
try-expand-dabbrev-from-kill ; dabbrev, kill records
try-complete-file-name ; filename
try-complete-file-name-partially ; filename, match first
try-expand-list ; expand list
try-expand-list-all-buffers ; expand list, all windows except for the visible
try-expand-line ; expand line
try-expand-line-all-buffers ; expand line, all windows except for the visible
try-complete-lisp-symbol ; symbol
try-complete-lisp-symbol-partially ; symbol, all windows except for the visible
try-expand-whole-kill ; kill-ring
))


;; -------------------------------------------
;; EXTERNAL CEDET
;; -------------------------------------------
(load-file "~/.emacs.d/site-lisp/cedet-1.1/common/cedet.el")
 
(require 'cedet)
(require 'eassist)
(require 'semantic-c)
(require 'semantic-gcc)
(require 'semanticdb)
 
(require 'semantic-decorate-include)
(require 'semantic-ia)
(require 'semantic-lex-spp)
(require 'semantic-analyze-complete)
(require 'semantic-analyze-refs)
(require 'semantic-decorate-include)
 
(when (not (member system-type '(gnu gnu/linux darwin cygwin)))
(if (executable-find "gcc")
(semantic-gcc-setup)
(message "GCC is not installed and semantic analysis will be restriced.")))
 
(setq pulse-flag 'never)
(setq semanticdb-default-save-directory
(expand-file-name "~/.emacs.d/semanticdb"))
(setq eassist-header-switches
'(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
("c" . ("h"))
("m" . ("h"))
("mm" . ("h"))))
 
;; (semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;; (semantic-load-enable-guady-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)
 
;; (global-ede-mode 1) ; Enable the Project management system
;; (global-srecode-minor-mode 1) ; Enable template insertion menu
(global-semantic-tag-folding-mode 1) ; Enable semantic code folding
 
;; --------------------------------------------------
;; Save the current jump point in order to jump back.
;; http://comments.gmane.org/gmane.emacs.cedet/5127
;; --------------------------------------------------
 
(defvar semantic-tags-location-ring (make-ring 64))
 
(defun semantic-goto-definition (point)
"Goto definition using semantic-ia-fast-jump
save the pointer marker if tag is found"
(interactive "d")
(condition-case err
(progn
(ring-insert semantic-tags-location-ring (point-marker))
(semantic-ia-fast-jump point))
(error
;;if not found remove the tag saved in the ring
(set-marker (ring-remove semantic-tags-location-ring 0) nil nil)
(signal (car err) (cdr err)))))
 
(defun semantic-pop-tag-mark ()
"popup the tag save by semantic-goto-definition"
(interactive)
(if (ring-empty-p semantic-tags-location-ring)
(message "%s" "No more tags available")
(let* ((marker (ring-remove semantic-tags-location-ring 0))
(buff (marker-buffer marker))
(pos (marker-position marker)))
(if (not buff)
(message "Buffer has been deleted")
(switch-to-buffer buff)
(goto-char pos))
(set-marker marker nil nil))))
 
 
;; ------------------
;; CEDET Key bindings
;; ------------------
 
 
(defun cedet-common-mode ()
(local-set-key (kbd "C-c j") 'semantic-goto-definition)
(local-set-key (kbd "C-c b") 'semantic-pop-tag-mark)
(local-set-key (kbd "C-c p") 'semantic-ia-show-summary)
(local-set-key (kbd "C-c d") 'semantic-ia-show-doc)
(local-set-key (kbd "C-c p") 'semantic-analyze-proto-impl-toggle)
 
(local-set-key (kbd "C-c f") 'semantic-symref)
(local-set-key (kbd "C-c r") 'semantic-symref-symbol)
 
(local-set-key (kbd "C-c <left>") 'semantic-tag-folding-fold-block)
(local-set-key (kbd "C-c <right>") 'semantic-tag-folding-show-block)
 
(local-set-key (kbd "C-c l") 'eassist-list-methods)
 
(if window-system
(local-set-key (kbd "M-n") 'semantic-ia-complete-symbol-menu)))
 
(defun cedet-c-c++-common-mode ()
;; (local-set-key "." 'semantic-complete-self-insert)
;; (local-set-key ">" 'semantic-complete-self-insert)
(semantic-default-c-setup)
(local-set-key (kbd "C-c s") 'eassist-switch-h-cpp)) ; Jump between .c and .h
 
 
 
 
;; -------------------------------------------
;; CODE EXTRA KEYWORDS
;; -------------------------------------------
(defun extra-keyword-mode ()
(interactive)
(font-lock-add-keywords nil '(("\\<\\(FIX\\|FIXME\\|TODO\\|BUG\\|XXX\\|HACK\\)\\(:\\|!\\| \\)"
1 font-lock-warning-face t)))
(font-lock-add-keywords nil '(("\\<\\(DONE\\):"
1 font-lock-doc-face t)))
(font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$"
1 font-lock-warning-face t))))
 
 
;; -------------------------------------------
;; CODE-COMMON-MODE
;; -------------------------------------------
(defun code-common-mode ()
(setq indent-tabs-mode nil)
(which-function-mode t)
(auto-fill-mode)
(extra-keyword-mode)
(cedet-common-mode))
 
 
 
;; -------------------------------------------
;; EMACS-LISP-MODE
;; -------------------------------------------
(defun emacs-lisp-mode-hook-func ()
(code-common-mode)
(define-key emacs-lisp-mode-map (kbd "RET") 'newline-and-indent)
(define-key emacs-lisp-mode-map (kbd "TAB") 'indent-or-complete))
 
(add-hook 'emacs-lisp-mode-hook 'emacs-lisp-mode-hook-func)
 
 
 
 
 
;; -------------------------------------------
;; MAKEFILE-MODE
;; -------------------------------------------
(add-hook 'makefile-mode-hook
'(lambda ()
(setq show-trailing-whitespace t)))
 
 
 
 
;; -------------------------------------------
;; SHELL-MODE
;; -------------------------------------------
(add-hook 'shell-mode-hook
'(lambda ()
(setq comint-prompt-read-only t)
(setq shell-command-completion-mode t)))
 
(defun kill-shell-buffer (process event)
"Kill shell buffer when exit"
(kill-buffer (process-buffer process)))
 
(defun kill-shell-buffer-after-exit ()
"kill shell process"
(set-process-sentinel (get-buffer-process (current-buffer))
#'kill-shell-buffer))
 
(add-hook 'shell-mode-hook 'kill-shell-buffer-after-exit t)
 
 
 
 
;; -------------------------------------------
;; CC-MODE, INCLUDING C, C++, JAVA
;; -------------------------------------------
(require 'cc-mode)
 
;; note: make sure gnu indent is installed.
(defun format-buffer ()
(interactive)
(if (not (executable-find "indent"))
(message "Indent is not installed."))
(progn
(shell-command-on-region (point-min) (point-max) "indent -kr -nut -i2" nil t)
(message "Buffer formatted")))
 
;; cc common mode
(defun cc-common-mode ()
(setq c-basic-offset 2)
(if (and (>= emacs-major-version 23)
(>= emacs-minor-version 2))
(subword-mode 1))
(code-common-mode)
 
;; cc mode key bindings
(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(define-key c-mode-base-map (kbd "TAB") 'indent-or-complete)
(define-key c-mode-base-map (kbd "<f5>") 'gdb)
(define-key c-mode-base-map (kbd "<f7>") 'compile))
 
 
;; c mode
(defun c-mode-common-hook-func ()
(c-set-style "k&r")
(cedet-c-c++-common-mode)
(cc-common-mode)
(local-set-key (kbd "<f12>") 'format-buffer))
 
;; c++ mode
(defun c++-mode-common-hook-func ()
(c-set-style "stroustrup")
(cedet-c-c++-common-mode)
(cc-common-mode)
(local-set-key (kbd "<f12>") 'format-buffer))
 
;; java mode
(defun java-mode-common-hook-func ()
(c-set-style "k&r")
(cc-common-mode))
 
 
(add-hook 'c-mode-hook 'c-mode-common-hook-func)
(add-hook 'c++-mode-hook 'c++-mode-common-hook-func)
(add-hook 'java-mode-hook 'java-mode-common-hook-func)
 
 
 
;; -------------------------------------------
;; GDB
;; -------------------------------------------
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)
 
(add-hook 'gdb-mode-hook
'(lambda ()
(define-key c-mode-base-map (kbd "<f5>") 'gud-go)
(define-key c-mode-base-map (kbd "<f6>") 'gdb-restore-windows)
(define-key c-mode-base-map (kbd "<f7>") 'compile)
(define-key c-mode-base-map (kbd "<f9>") 'gud-break)
(define-key c-mode-base-map (kbd "<C-f9>") 'gud-remove)
(define-key c-mode-base-map (kbd "<f10>") 'gud-step)
(define-key c-mode-base-map (kbd "<f11>") 'gud-next)))
 
 
 
;; -------------------------------------------
;; ECB
;; -------------------------------------------
(require 'ecb-autoloads)
 
(setq ecb-auto-activate nil)
(setq ecb-tip-of-the-day nil)
(setq ecb-tree-indent 2)
(setq ecb-windows-height 0.5)
(setq ecb-windows-width 0.18)
(setq ecb-auto-compatibility-check nil)
(setq ecb-version-check nil)
(setq ecb-primary-secondary-mouse-buttons (quote mouse-1--C-mouse-1))
(setq inhibit-startup-message t)
 
(defun toggle-ecb ()
"Toggles ECB"
(interactive)
(if (and (boundp 'ecb-activated-window-configuration)
ecb-activated-window-configuration)
(ecb-deactivate)
(ecb-activate)))
 
(global-set-key (kbd "<f1>") 'toggle-ecb)
 
 
 
;; -------------------------------------------
;; AUCTEX
;; -------------------------------------------
;(load "~/.emacs.d/site-lisp/auctex-current/auctex.el" nil t t)
;(load "~/.emacs.d/site-lisp/auctex-current/preview/preview-latex.el" nil t t)
 
;(setq TeX-auto-save t) ; Enable parse on save
;(setq TeX-parse-self t) ; Enable parse on load
;(setq-default TeX-master nil) ; Query for master file
 
;;----------------------------------------
;; RefTeX handling of \ref, \label, \cite
;;----------------------------------------
;; configure RefTeX before loading it.
;(setq reftex-enable-partial-scans t) ; only parse current file
;(setq reftex-save-parse-info t) ; save parsing results
;(setq reftex-use-multiple-selection-buffers t) ; diff buffs for label select.
;(setq reftex-plug-into-AUCTeX t) ; interact with AucTeX, of course
;(setq reftex-extra-bindings t) ; use additional C-c bindings
;(setq reftex-external-file-finders ; bibtex files search type
;'(("tex" . "kpsewhich -format=.tex %f")
;("bib" . "kpsewhich -format=.bib %f")))
; 
;(setq TeX-newline-function 'reindent-then-newline-and-indent)
;(setq TeX-PDF-mode t)
;(setq TeX-save-query nil)
;(setq TeX-auto-untabify t) ; automatically remove all tabs from a file before saving it
;(setq TeX-engine 'xetex) ; use xelatex default
;(setq TeX-show-compilation t) ; display compilation windows
;(setq preview-scale-function 1.5) ; magnify preview by 1.5 times
; 
;(defun latex-indent-or-complete ()
;"Complete if point is at end of a word, otherwise indent line."
;(interactive)
;(if (looking-at "\\>")
;(TeX-complete-symbol)
;(indent-for-tab-command)))
; 
;(defun auctex-latex-mode-hook-func ()
;(flyspell-mode t)
;(TeX-fold-mode t)
;(turn-on-auto-fill)
;(turn-on-reftex)
;(LaTeX-math-mode)
;(setq indent-tabs-mode nil)
;;; LaTeX mode shares indent function with text-mode, so we need to explicitly set it.
;(setq indent-line-function 'LaTeX-indent-line)
;(define-key LaTeX-mode-map (kbd "TAB") 'latex-indent-or-complete))
; 
;(defun emacs-latex-mode-hook-func ()
;(turn-on-auto-fill)
;(turn-on-reftex)
;(setq indent-tabs-mode nil))
; 
;(add-hook 'LaTeX-mode-hook 'auctex-latex-mode-hook-func) ; with AucTex latex mode
;(add-hook 'laTeX-mode-hook 'emacs-latex-mode-hook-func) ; with Emacs latex mode
;(add-hook 'reftex-load-hook 'imenu-add-menubar-index)
;(add-hook 'reftex-mode-hook 'imenu-add-menubar-index)
; 
 
;; -------------------------------------------
;; GNUPLOT MODE
;; -------------------------------------------
(eval-after-load "gnuplot" ; wait until gnuplot module is loaded.
(add-hook 'gnuplot-mode-hook
'(lambda ()
(define-key gnuplot-mode-map "\C-c\C-c" 'gnuplot-send-buffer-to-gnuplot))))
 
 
 
;; -------------------------------------------
;; FLYSPELL
;; -------------------------------------------
(setq-default ispell-program-name "aspell")
(setq ispell-dictionary "american")
(setq flyspell-doublon-as-error-flag nil) ; Duplicated words may not be wrong
(setq flyspell-sort-corrections nil) ; Ignore upper-case word
 
(defun flyspell-check-next-highlighted-word ()
"Custom function to spell check next highlighted word"
(interactive)
(flyspell-goto-next-error)
(ispell-word))
 
;; easy spell check
(global-set-key (kbd "<f8>") 'ispell-word) ; run spell check on current cursor
(global-set-key (kbd "C-S-<f8>") 'flyspell-mode) ; toggle flyspell mode
(global-set-key (kbd "S-<f8>") 'flyspell-check-previous-highlighted-word) ; run spell check before current cursor
(global-set-key (kbd "C-<f8>") 'flyspell-check-next-highlighted-word) ; run spell check after current cursor
 
(defun my-flyspell-ignore-uppercase (beg end &rest rest)
(while (and (< beg end)
(let ((c (char-after beg)))
(not (= c (downcase c)))))
(setq beg (1+ beg)))
(= beg end))
 
(add-hook 'flyspell-incorrect-hook 'my-flyspell-ignore-uppercase)
 
 
 
 
 
 
 
;; -------------------------------------------
;; ERC
;; -------------------------------------------
(require 'erc)
 
;; Uncomment if you want to disable auto fill.
;; (add-hook 'erc-mode-hook '(lambda () (erc-fill-disable)))
(defun erc-fill-disable ()
"Cleanup hooks, disable `erc-fill-mode'."
(interactive)
(remove-hook 'erc-insert-modify-hook 'erc-fill)
(remove-hook 'erc-send-modify-hook 'erc-fill))
 
;; Auto adjust fill column when window configuration changes.
(add-hook 'window-configuration-change-hook
'(lambda ()
(interactive)
(setq erc-fill-column (- (window-width) 10))))
 
(setq erc-default-coding-system '(utf-8 . utf-8))
(setq erc-autoaway-mode t) ; auto away
(setq erc-autoaway-idle-seconds 600) ; auto away after 10 min
(setq erc-server-auto-reconnect t) ; auto reconnect
(setq erc-prompt ">") ; prompt symbol
;; (setq erc-fill-static-center 0) ; fill in center
;; (setq erc-fill-column 120) ; erc fill column
(setq erc-timestamp-format "[%H:%M:%S] ") ; timestamp format
(setq erc-timestamp-format-right "[%H:%M:%S]") ; right side timestamp format
;; (setq erc-timestamp-right-column 130) ; column for timestamp
(setq erc-insert-timestamp-function 'erc-insert-timestamp-left) ; insert timestamp on the left
(setq erc-insert-away-timestamp-function 'erc-insert-timestamp-left) ; insert away timestamp on the left
(setq erc-track-position-in-mode-line t) ; display channel info in mode line
(setq erc-enable-logging nil) ; no log
(setq erc-log-mode nil) ; disable log mode
(setq erc-log-channels-directory ; directory for log
"~/.emacs.d/erc/logs/")
 
(setq erc-ignore-list nil)
(setq erc-hide-list
'("JOIN" "PART" "QUIT" "MODE"))
 
;; Make C-c RET (or C-c C-RET) send messages instead of RET. This has
;; been commented out to avoid confusing new users.
;; (define-key erc-mode-map (kbd "RET") nil)
;; (define-key erc-mode-map (kbd "C-c RET") 'erc-send-current-line)
;; (define-key erc-mode-map (kbd "C-c C-RET") 'erc-send-current-line)
 
 
 
;;; Options
(setq erc-nick "yuezhu") ; nickname
(setq erc-user-full-name nil) ; fullname
;; This causes ERC to connect to the Freenode network upon hitting
;; C-c e f. Replace MYNICK with your IRC nick.
(global-set-key (kbd "C-c er")
'(lambda ()
(interactive)
(erc :server "irc.freenode.net" :port "6667"
:nick "digitalzy")))
 
(defun split-window-to-four ()
"split current frame to four"
(interactive)
(progn
(split-window-horizontally)
(set-window-buffer (next-window) (other-buffer))
(split-window-vertically)
(set-window-buffer (next-window) (other-buffer))
(other-window 2)
(split-window-vertically)
(set-window-buffer (next-window) (other-buffer))
(other-window -2)))
 
(global-set-key (kbd "C-c ss") 'split-window-to-four)
 
 
 
;; Join the #emacs and #erc channels whenever connecting to Freenode.
(setq erc-autojoin-mode t)
(setq erc-autojoin-channels-alist
'(("freenode.net"
"#emacs"
"#ubuntu"
"#emacs-cn"
"#ubuntu-cn"
)))
 
;; Interpret mIRC-style color commands in IRC chats
(setq erc-interpret-mirc-color t)
 
;; The following are commented out by default, but users of other
;; non-Emacs IRC clients might find them useful.
;; Kill buffers for channels after /part
;; (setq erc-kill-buffer-on-part t)
;; Kill buffers for private queries after quitting the server
;; (setq erc-kill-queries-on-quit t)
;; Kill buffers for server messages after quitting the server
;; (setq erc-kill-server-buffer-on-quit t)
 
;; -------------------------------------------
;;
;; End of dotemacs
;;
;; -------------------------------------------

