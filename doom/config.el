(setq user-full-name "hakou guelfen"
      user-mail-address "hakoudev@gmail.com")
(setq doom-font (font-spec :family "JetBrains Mono" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "JetBrains Mono" :size 18))

(setq display-line-numbers-type t)
(setq treemacs-position 'right
      treemacs-width 45)

(beacon-mode 1)
(setq confirm-kill-emacs nil)
(setq +bidi-global-mode t)

;; (setq haskell-stylish-on-save t)
;; (add-hook 'before-save-hook #'+format/buffer nil t)

(after! org
  (setq org-directory "~/Documents/Org")
  (setq org-log-done 'time))
(with-eval-after-load 'org (global-org-modern-mode))

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t))

(setq org-agenda-files '("~/Documents/Org/Agenda" "~/Documents/Org/todo.org"))

(use-package! org-super-agenda
  :after org-agenda
  :config
  ;; Enable org-super-agenda
  (org-super-agenda-mode)
  (setq org-agenda-block-separator ?_)

  ;; remove uncessary infos from agenda
  (setq org-agenda-span 1
        org-agenda-start-day "+0d"
        ;; org-agenda-skip-timestamp-if-done t
        ;; org-agenda-skip-deadline-if-done t
        ;; org-agenda-skip-scheduled-if-done t
        ;; org-agenda-skip-scheduled-if-deadline-is-shown t
        ;; org-agenda-skip-timestamp-if-deadline-is-shown t
        )
  (setq org-agenda-hide-tags-regexp ".*")

;; Customizing the groups
(setq org-super-agenda-groups
       '((:name " Overdue "
                :scheduled past
                :order 2
                :face 'error)

         (:name "ALGO"
                :tag "ALGO"
                :order 3)
         (:name "DB"
                :tag "DB"
                :order 4)
         (:name "OPT"
                :tag "OPT"
                :order 5)
         (:name "Fouille"
                :tag "Fouille"
                :order 6)
         (:name "Entrepot"
                :tag "Entrepot"
                :order 7)
         (:name "TAI"
                :tag "TAI"
                :order 8)

        (:name " Today"
                :time-grid t
                :date today
                :scheduled today
                :order 1
                :face 'warning))))

(map! :desc "Next line"
      :map org-super-agenda-header-map
      "j" 'org-agenda-next-line)

(map! :desc "Next line"
      :map org-super-agenda-header-map
      "k" 'org-agenda-previous-line)

(setq olivetti-style 'fancy
      olivetti-margin-width 100)
(setq-default olivetti-body-width 100)
(add-hook 'org-agenda-mode-hook 'olivetti-mode)

(setq +latex-viewers '(zathura))
(with-eval-after-load 'ox-latex)

(require 'elfeed-goodies)
(elfeed-goodies/setup)
(setq elfeed-goodies/entry-pane-size 0.5)

(evil-define-key 'normal elfeed-show-mode-map
  (kbd "V") 'elfeed-tube-mpv
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "K") 'elfeed-goodies/split-show-prev)
(evil-define-key 'normal elfeed-search-mode-map
  (kbd "J") 'elfeed-goodies/split-show-next
  (kbd "U") 'elfeed-update
  (kbd "K") 'elfeed-goodies/split-show-prev)

(use-package! elfeed-org
  :after elfeed
  :config
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.config/doom/feeds.org")))

(use-package elfeed-tube
  :ensure t
  :after elfeed
  :demand t
  :config
  ;; (setq elfeed-tube-auto-save-p nil) ; default value
  ;; (setq elfeed-tube-auto-fetch-p t)  ; default value
  (elfeed-tube-setup)

  :bind (:map elfeed-show-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)
         :map elfeed-search-mode-map
         ("F" . elfeed-tube-fetch)
         ([remap save-buffer] . elfeed-tube-save)))

(map! :leader
      (:prefix ("o" . "Toggle")
       :desc "Toggle imenu shown in a sidebar" "i" #'lsp-ui-imenu))

(add-to-list 'default-frame-alist '(alpha-background . 90))

;; (require 'yaml-mode)
;; (require 'yaml)

;; (defun load-yaml-file (filename)
;;   (with-temp-buffer
;;     (insert-file-contents filename)
;;     (goto-char (point-min))
;;     (yaml-mode)
;;     (setq my-data (yaml-parse-string (buffer-string))))
;;   my-data)

;; (setq my-data (load-yaml-file "~/.config/theme/setting.yaml"))
;; (setq emacs-setting (gethash 'emacs (gethash 'setting my-data)))
;; (message "The Emacs setting is `%s`." (intern emacs-setting))

(setq doom-theme 'doom-vibrant)

;; add this to .emacs.d/early-init.el for flutter to work properly
;; it adds the flutter sdk path to emacs
(setenv "PATH" (concat (getenv "PATH") ":/opt/flutter/bin"))
(setq exec-path (append exec-path '("/opt/flutter/bin")))

(use-package dart-mode
  :custom
  (dart-format-on-save t))

(use-package flutter
  :after dart-mode
  :hook (dart-mode . (lambda ()
    (add-hook 'after-save-hook #'flutter-run-or-hot-reload nil t))))

(defun flutter-run-dev ()
  (interactive)
  (let ((flutter-command "flutter run --flavor dev -t lib/main/main_dev.dart"))
    (flutter-run "--flavor dev -t lib/main/main_dev.dart")))

(defun flutter-run-prod ()
  (interactive)
  (let ((flutter-command "flutter run --flavor prod -t lib/main/main_prod.dart"))
    (flutter-run "--flavor prod -t lib/main/main_prod.dart")))


(map! :leader
      (:prefix ("m" . "prefix")
        :desc "flutter-run_dev"
        "f d" #'flutter-run-dev))

(map! :leader
      (:prefix ("m" . "prefix")
        :desc "flutter-run_prod"
        "f p" #'flutter-run-prod))

(set-formatter! 'snakefmt '("snakefmt" "-") :modes '(snakemake-mode))
