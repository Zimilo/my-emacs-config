(add-to-list 'load-path (expand-file-name "~/.emacs.d"))
(add-to-list 'exec-path "/usr/local/bin")
;;;Disable the Toolbar
(tool-bar-mode -1)
;;;Show the line number and column number
(global-linum-mode t)
(column-number-mode t)
;;;Enabled the ido mode
(ido-mode t)
;;; Install the kernel style
(c-add-style "kernel-coding"
             '( "linux"
                (c-basic-offset . 8)
                (indent-tabs-mode . t)
                (tab-width . 8)
                (c-comment-only-line-offset . 0)
                (c-hanging-braces-alist
                 (brace-list-open)
                 (brace-entry-open)
                 (substatement-open after)
                 (block-close . c-snug-do-while)
                 (arglist-cont-nonempty))
                (c-cleanup-list brace-else-brace)
                (c-offsets-alist
                 (statement-block-intro . +)
                 (knr-argdecl-intro . 0)
                 (substatement-open . 0)
                 (substatement-label . 0)
                 (label . 0)
                 (statement-cont . +))
                ))
(add-hook 'c-mode-hook
          (lambda ()
	    (c-set-style "kernel-coding")
	    ))
;;;Enabled the cscope support
(add-hook 'c-mode-common-hook
	  '(lambda ()
	    (require 'xcscope)))
;;;Set the backup directory
(setq backup-directory-alist
          `((".*" . ,temporary-file-directory)))
    (setq auto-save-file-name-transforms
          `((".*" ,temporary-file-directory t)))

;;;Shell 
(setq shell-file-name "/bin/bash")
(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t) 
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t) 

;;;Git Support
(add-to-list 'load-path (expand-file-name "~/.emacs.d/git-emacs"))
(require 'git-emacs)


(put 'erase-buffer 'disabled nil)

;;;Load the color theme
(load-theme 'wombat t)

;;;Display the time
(display-time)


;;; Fullscreen and maximized

(defun my-fullscreen ()
  (interactive)
  (if (not (string= system-type "darwin"))
      (x-send-client-message
       nil 0 nil "_NET_WM_STATE" 32
       '(2 "_NET_WM_STATE_FULLSCREEN" 0)))
  )

(defun my-maximized ()
  (interactive)
  (if (not (string= system-type "darwin"))
    (x-send-client-message
     nil 0 nil "_NET_WM_STATE" 32
     '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
    (interactive)
    (x-send-client-message
     nil 0 nil "_NET_WM_STATE" 32
     '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
  )

(my-maximized)
(my-fullscreen)

;;;Window Numbering, Lets M 1 switch window
(require 'window-numbering)
(window-numbering-mode 1)

;;;Key Bindings
(global-set-key (kbd "<f2>") 'rename-buffer)
(global-set-key (kbd "C-c z") 'shell)
(global-set-key (kbd "<f10>") 'my-fullscreen)

(require 'rock-erc)

;;;LaTex
(require 'rock-latex)
