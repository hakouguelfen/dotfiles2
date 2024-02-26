(setq user-full-name "hakou guelfen"
      user-mail-address "hakoudev@gmail.com")
(setq doom-font (font-spec :family "Fira Code" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Fira Code" :size 18))

(setq display-line-numbers-type t)

(beacon-mode 1)
(setq confirm-kill-emacs nil)

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

;;;------ Org agenda configuration ------;;;
;; Set span for agenda to be just daily
(setq org-agenda-span 1
      org-agenda-start-day "+0d"
      org-agenda-skip-timestamp-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-scheduled-if-deadline-is-shown t
      org-agenda-skip-timestamp-if-deadline-is-shown t)

(setq org-agenda-hide-tags-regexp ".*")

(require 'org-super-agenda)
(setq org-super-agenda-groups
       '((:name " Overdue "
                :scheduled past
                :order 2
                :face 'error)

         (:name "Personal "
                :and(:file-path "Personal.p" :not (:tag "event"))
                :order 3)

         (:name "Family "
                :and(:file-path "Family.s" :not (:tag "event"))
                :order 3)

         (:name "Writing "
                :and(:file-path "Author.p" :not (:tag "event"))
                :order 3)

         (:name "Learning "
                :and(:file-path "Knowledge.p" :not (:tag "event"))
                :order 3)

          (:name " Today "  ; Optionally specify section name
                :time-grid t
                :date today
                :scheduled today
                :order 1
                :face 'warning)

))

(org-super-agenda-mode t)

(map! :desc "Next line"
      :map org-super-agenda-header-map
      "j" 'org-agenda-next-line)

(map! :desc "Next line"
      :map org-super-agenda-header-map
      "k" 'org-agenda-previous-line)

(setq olivetti-style 'fancy
      olivetti-margin-width 100)
(setq-default olivetti-body-width 100)
(add-hook 'org-mode-hook 'org-roam-olivetti-mode)

(setq +latex-viewers '(zathura))
(with-eval-after-load 'ox-latex)

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
;; (setenv "PATH" (concat (getenv "PATH") ":/opt/flutter/bin"))
;; (setq exec-path (append exec-path '("/opt/flutter/bin")))

;; (use-package dart-mode
;;   :custom
;;   (dart-format-on-save t))

;; (use-package flutter
;;   :after dart-mode
;;   :hook (dart-mode . (lambda ()
;;     (add-hook 'after-save-hook #'flutter-run-or-hot-reload nil t))))

;; (defun flutter-run-dev ()
;;   (interactive)
;;   (let ((flutter-command "flutter run --flavor dev -t lib/main/main_dev.dart"))
;;     (flutter-run "--flavor dev -t lib/main/main_dev.dart")))

;; (defun flutter-run-prod ()
;;   (interactive)
;;   (let ((flutter-command "flutter run --flavor prod -t lib/main/main_prod.dart"))
;;     (flutter-run "--flavor prod -t lib/main/main_prod.dart")))


;; (map! :leader
;;       (:prefix ("m" . "prefix")
;;         :desc "flutter-run_dev"
;;         "f d" #'flutter-run-dev))

;; (map! :leader
;;       (:prefix ("m" . "prefix")
;;         :desc "flutter-run_prod"
;;         "f p" #'flutter-run-prod))
