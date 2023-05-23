[[id:7a7c7c20-1ba7-452c-9450-c9725a46a857][LVM]]
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c4063322b5011829f7fdd7509979b5823e8eea2abf1fe5572ec4b7af1dd78519" "3d47380bf5aa650e7b8e049e7ae54cdada54d0637e7bac39e4cc6afb44e8463b" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" default))
 '(package-selected-packages
   '(elcord tide docker-compose-mode yasnippet-classic-snippets langdoc which-key try use-package))
 '(warning-suppress-types '((initialization) (defvaralias))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq  x-meta-keysym 'super
       x-super-keysym 'meta)
;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)
 ;;(set-frame-parameter (selected-frame) 'alpha '(<active> . <inactive>))
 ;;(set-frame-parameter (selected-frame) 'alpha <both>)
 (set-frame-parameter (selected-frame) 'alpha '(90 . 70))
 (add-to-list 'default-frame-alist '(alpha . (90 . 50)))
;; markdown live preview

(defun +markdown-live-preview-window-xwidget-webkit (file)
  "Preview FILE with xwidget-webkit.
To be used with `markdown-live-preview-window-function'."
  (let ((uri (format "file://%s" file)))
      (xwidget-webkit-browse-url uri)
      xwidget-webkit-last-session-buffer))

(set-popup-rule! "^\\*xwidget" :side 'right :size .50 :ttl 0 :quit nil)

(setq markdown-live-preview-window-function
      'markdown-live-preview-window-xwidget-webkit)

(add-hook 'evil-insert-state-exit-hook
          (lambda ()
            (call-interactively #'save-buffer)))
;; dap keybindings
(map! :map dap-mode-map
      :leader
      :prefix ("d" . "dap")
      ;; basics
      :desc "dap next"          "n" #'dap-next
      :desc "dap step in"       "i" #'dap-step-in
      :desc "dap step out"      "o" #'dap-step-out
      :desc "dap continue"      "c" #'dap-continue
      :desc "dap hydra"         "h" #'dap-hydra
      :desc "dap debug restart" "r" #'dap-debug-restart
      :desc "dap debug"         "s" #'dap-debug

      ;; debug
      :prefix ("dd" . "Debug")
      :desc "dap debug recent"  "r" #'dap-debug-recent
      :desc "dap debug last"    "l" #'dap-debug-last

      ;; eval
      :prefix ("de" . "Eval")
      :desc "eval"                "e" #'dap-eval
      :desc "eval region"         "r" #'dap-eval-region
      :desc "eval thing at point" "s" #'dap-eval-thing-at-point
      :desc "add expression"      "a" #'dap-ui-expressions-add
      :desc "remove expression"   "d" #'dap-ui-expressions-remove

      :prefix ("db" . "Breakpoint")
      :desc "dap breakpoint toggle"      "b" #'dap-breakpoint-toggle
      :desc "dap breakpoint condition"   "c" #'dap-breakpoint-condition
      :desc "dap breakpoint hit count"   "h" #'dap-breakpoint-hit-condition
      :desc "dap breakpoint log message" "l" #'dap-breakpoint-log-message)

;; docker auto file name
(put 'dockerfile-image-name 'safe-local-variable #'stringp)

(set-frame-parameter (selected-frame) 'alpha '(100 100))

(add-to-list 'default-frame-alist '(alpha 100 100))

(defun my/helm-do-grep-current-directory-tree ()
  "Recursively search current directory.
If a parent directory has a `dir-locals-file', use that as the
root instead."
  (interactive)
  (let ((variables-file (dir-locals-find-file
                         (or (buffer-file-name) default-directory))))
    (helm-do-grep-1
     (list
      (cond
       ((stringp variables-file)
        (file-name-directory variables-file))
       ((consp variables-file)
        (nth 0 variables-file))
       (t default-directory)))
     t nil '("*"))))
(setq org-roam-directory "/media/data/notes/org")
(setenv "PATH"
        (concat
         "/home/gokul/go/bin" path-separator
         (getenv "PATH")))
(require 'elcord)
(elcord-mode)
