(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; catppuccin theme
(setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha

;; fix window resizing with niri
;; for niri, also set up init-early.el
(setopt frame-resize-pixelwise t)

;; something something better lsp
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; set font
(set-frame-font "Iosevka 26")

;; show trailing spaces
(setq whitespace-style '(space-mark))
(setq whitespace-display-mappings '((space-mark 32 [183] [46])))


;; remove top bars
(tool-bar-mode -1)
(menu-bar-mode -1)

;; remove splash screen
(setq inhibit-startup-screen t)

;; number line
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; show trailing whitespaces
(setq-default show-trailing-whitespace t)

;; smooth(er) scrolling
(setq scroll-conservatively 10
      scroll-margin 15)

;; better scrolling
(defun gcm-scroll-down ()
      (interactive)
      (scroll-up 1))
    (defun gcm-scroll-up ()
      (interactive)
      (scroll-down 1))
    (global-set-key [(control down)] 'gcm-scroll-down)
    (global-set-key [(control up)]   'gcm-scroll-up)


;; ido??
(require 'ido)
(ido-mode t)

;; flycheck
(global-flycheck-mode +1)

;; indentation size
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; save swapfiles in $XDG_CONFIG/emacs/autosave
;; turned off as borked ill fix it later
;; (setq auto-save-file-name-transforms
      ;; '((".*" "~/.config/emacs/autosave/" t)))

;; org mode
(require 'org)

;; enable transient mark mode
(transient-mark-mode 1)

;; some bs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(c-basic-offset 4)
 '(custom-enabled-themes '(sanityinc-tomorrow-bright))
 '(custom-safe-themes
   '("b11edd2e0f97a0a7d5e66a9b82091b44431401ac394478beb44389cf54e6db28"
     "04aa1c3ccaee1cc2b93b246c6fbcd597f7e6832a97aaeac7e5891e6863236f9f"
     "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "e900ae738225380abd1edc0c76535a12b8a6669c7a3180431ba0157a47bbf75e"
     default))
 '(package-selected-packages
   '(catppuccin-theme color-theme-sanityinc-tomorrow corfu eat eglot-java
                      evil magit yasnippet yasnippet-snippets)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
