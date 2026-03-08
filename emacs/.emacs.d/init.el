(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; fix window resizing with niri
;; for niri, also set up init-early.el
(setopt frame-resize-pixelwise t)

;; something something better lsp
(setq gc-cons-threshold 100000000)
(setq read-process-output-max (* 1024 1024))

;; vterm for better integrated terminal
(use-package vterm
    :ensure t)

;; set font
(set-frame-font "Iosevka 26")

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

;; ido??
(require 'ido)
(ido-mode t)

;; indentation size
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; save swapfiles in ~/.emacs.d/auto-save/
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save/" t)))

;; some bs
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(sanityinc-tomorrow-bright))
 '(custom-safe-themes
   '("b11edd2e0f97a0a7d5e66a9b82091b44431401ac394478beb44389cf54e6db28"
     "04aa1c3ccaee1cc2b93b246c6fbcd597f7e6832a97aaeac7e5891e6863236f9f"
     "6fc9e40b4375d9d8d0d9521505849ab4d04220ed470db0b78b700230da0a86c1"
     "01a9797244146bbae39b18ef37e6f2ca5bebded90d9fe3a2f342a9e863aaa4fd"
     "e900ae738225380abd1edc0c76535a12b8a6669c7a3180431ba0157a47bbf75e"
     default))
 '(package-selected-packages
   '(catppuccin-theme color-theme-sanityinc-tomorrow evil vterm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
