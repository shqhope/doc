;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
;;    a simple config of .emacs  
;; File:.emacs  
;; Author: shiwenqiang  
;; Version: 0.1  
;; Date: 2015.8.22  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
;; default to better frame titles  
;; 设置frame 的标题  
(setq frame-title-format  
      (concat  "%b - emacs@" (system-name)))  
  
;; emacs 菜单栏的选项配置的字体颜色主题  
(custom-set-variables  
  ;; custom-set-variables was added by Custom.  
  ;; If you edit it by hand, you could mess it up, so be careful.  
  ;; Your init file should contain only one such instance.  
  ;; If there is more than one, they won't work right.  
 '(column-number-mode t)  
 '(display-time-mode t)  
 '(show-paren-mode t))  
(custom-set-faces  
  ;; custom-set-faces was added by Custom.  
  ;; If you edit it by hand, you could mess it up, so be careful.  
  ;; Your init file should contain only one such instance.  
  ;; If there is more than one, they won't work right.  
 '(default ((t (:inherit nil :stipple nil :background "gray14" :foreground "gray99" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))  
;;  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  
  
;;disable tool-bar  
(tool-bar-mode 0)  
  
;;enable menu-bar  
(menu-bar-mode t)  
  
;;display line num  
(global-linum-mode t)  
  
;;display column num  
(setq column-number-mode t)  
  
;;disable scroll stripe  
(scroll-bar-mode 0)  
  
;;display time  
(display-time-mode t)  
(setq display-time-24hr-format t)  
(setq display-time-day-and-date t)  
;; 设置桌面会话保存  
(load "desktop")  
(setq desktop-save-mode t)  
(setq desktop-read t)  
  
;;auto-load file which has changed  
(global-auto-revert-mode 1)  
  
;;set color theme  
(set-background-color "gray14")  
(set-foreground-color "gray99")  
  
;; 回车缩进  
(global-set-key "\C-m" 'newline-and-indent)  
(global-set-key (kbd "C-<return>") 'newline)  
  
;; 设置缩进【重点推荐这里的linux C编码风格及4空格替换TAB】  
(setq c-default-style "linux"  
      c-basic-offset 4)  
(setq-default indent-tabs-mode nil)  
(setq default-tab-width 4)  
(setq tab-width 4)  
(setq tab-stop-list ())  
  
;;emacs和外部程序的粘贴  
(setq x-select-enable-clipboard t)   
  
;; 默认显示 80列就换行   
(setq default-fill-column 80)   
  
;; 指定默认加载路径  
(add-to-list 'load-path' "~/.emacs.d/auto-load/xcscope")  
(require 'xcscope)  
  
;; set new method of kill a whole line  
;; 改造后的C-w ，在未选中目标时，剪切当前行  
(defadvice kill-ring-save (before slickcopy activate compile)  
  "When called interactively with no active region, copy a single line instead."  
  (interactive  
  (if mark-active (list (region-beginning) (region-end))  
    (list (line-beginning-position)  
          (line-beginning-position 2)))))  
;; 改造后的M-w , 在未选中目标时，复制当前行  
(defadvice kill-region (before slickcut activate compile)  
  "When called interactively with no active region, kill a single line instead."  
  (interactive  
   (if mark-active (list (region-beginning) (region-end))  
     (list (line-beginning-position)  
           (line-beginning-position 2)))))  
  
;; 这里定义的是全局的cscope快捷键映射，不区分任何语言模式，全部起效。  
;;(define-key global-map [(control f3)]  'cscope-set-initial-directory)  
;;(define-key global-map [(control f4)]  'cscope-unset-initial-directory)  
;;(define-key global-map [(control f5)]  'cscope-find-this-symbol)  
;;(define-key global-map [(control f6)]  'cscope-find-global-definition)  
;;(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)  
;;(define-key global-map [(control f8)]  'cscope-pop-mark)  
;;(define-key global-map [(control f9)]  'cscope-next-symbol)  
;;(define-key global-map [(control f10)] 'cscope-next-file)  
;;(define-key global-map [(control f11)] 'cscope-prev-symbol)  
;;(define-key global-map [(control f12)] 'cscope-prev-file)  
;;(define-key global-map [(meta f9)]     'cscope-display-buffer  
;;(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)  
;;  