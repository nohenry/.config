(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(gruber-darker))
 '(custom-safe-themes
   '("e13beeb34b932f309fb2c360a04a460821ca99fe58f69e65557d6c1b10ba18c7" default))
 '(package-selected-packages '(gruber-darker-theme ## rust-mode org))
 '(tool-bar-mode nil))
(require 'org)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(scroll-bar-mode 0)
(global-display-line-numbers-mode)
(set-face-attribute 'default nil :height 200)
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
(ido-mode 1)
(ido-everywhere 1)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq c-set-style "k&r")
(setq c-basic-offset 4)

(setq mac-option-modifier 'meta)

(defun org-shuffle ()
  (random 1000))

(add-to-list 'load-path (locate-user-emacs-file "odin/"))
(require 'odin-mode)

;; (autoload 'odin-mode "odin-mode" nil t)
;; (add-to-list 'auto-mode-alist '("\\.odin\\'" . zig-mode))
