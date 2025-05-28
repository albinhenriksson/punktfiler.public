;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1"
    "#e1e1e0"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-enabled-themes '(leuven-dark))
 '(display-time-mode t)
 '(ispell-dictionary nil)
 '(package-selected-packages '(nginx-mode markdownfmt markdown-mode bash-completion))
 '(save-place-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(truncate-lines t))

;; Aktivera MELPA-biblioteket.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; För bättre syntax-higlighting.
(require 'generic-x)

;; Syntax-markering för nginx-filer.
(require 'nginx-mode)
(add-to-list 'auto-mode-alist '("/nginx/sites-\\(?:available\\|enabled\\)/" . nginx-mode))

;; Markdown-läge.
(require 'markdown-mode)

;; Hur många pekare som helst!
;; (https://github.com/magnars/multiple-cursors.el)
;; To get out of multiple-cursors-mode, press <return> or C-g. The latter will
;; first disable multiple regions before disabling multiple cursors. If you want
;; to insert a newline in multiple-cursors-mode, use C-j.
(require 'multiple-cursors)
;(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-c C-SPC") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "H-SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C-<") 'set-rectangular-region-anchor)
;;-------------------------------------------------------------------------------

;; Sluta auto-backup:a!
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; Visa tid i 24-timmarsformat.
(setq display-time-format "%H:%M:%S")

;; Visa inte startskärmen
(setq inhibit-startup-screen 1)

;; Ha en lista med senast öppnade filer, öppna den med F7.
(recentf-mode 1)
(global-set-key (kbd "<f7>") 'recentf-open-files)

;; Aktivera IDO-mode överallt. IDO står för “Interactively DO things”.
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;; Bryt inte synlig rad mitt i ord.
;(global-visual-line-mode 1)

;; Bryt inte av rader!
;(setq-default global-visual-line-mode nil)
;(setq-default truncate-lines nil)

;; Öppna som root om så krävs.
(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

;; Ta bort markerad text vid inklistring.
(delete-selection-mode 1)

;; Följ alltid symboliska länkar och redigera den riktiga filen.
(setq vc-follow-symlinks t)

;;-------------------------------------------------------------------------------


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "DAMA" :slant normal :weight normal :height 120 :width normal)))))
