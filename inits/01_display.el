;;font
(cond ((string-match "apple-darwin" system-configuration) ;; Mac
              (when (and (>= emacs-major-version 24) (not (null window-system)))
	 (let* ((font-family "Menlo")
		(font-size 9)
		(font-height (* font-size 19))
		(jp-font-family "ヒラギノ角ゴ ProN"))
	   (set-face-attribute 'default nil :family font-family :height font-height)
	   (let ((name (frame-parameter nil 'font))
		 (jp-font-spec (font-spec :family jp-font-family))
		 (jp-characters '(katakana-jisx0201
				  cp932-2-byte
				  japanese-jisx0212
				  japanese-jisx0213-2
				  japanese-jisx0213.2004-1))
		 (font-spec (font-spec :family font-family))
		 (characters '((?\u00A0 . ?\u00FF)    ; Latin-1
                               (?\u0100 . ?\u017F)    ; Latin Extended-A
                               (?\u0180 . ?\u024F)    ; Latin Extended-B
                               (?\u0250 . ?\u02AF)    ; IPA Extensions
                               (?\u0370 . ?\u03FF)))) ; Greek and Coptic
	     (dolist (jp-character jp-characters)
               (set-fontset-font name jp-character jp-font-spec))
	     (dolist (character characters)
               (set-fontset-font name character font-spec))
	     (add-to-list 'face-font-rescale-alist (cons jp-font-family 1.2)))))
       

       ;; (set-face-attribute 'default nil
       ;; 			   :family "Myrica"
       ;; 			   :height 170 )
       )
      ((string-match "linux" system-configuration)        ;; Linux
       (when (and (>= emacs-major-version 24) (not (null window-system)))
	 (let* ((font-family "Menlo")
		(font-size 9)
		(font-height (* font-size 10))
		(jp-font-family "ヒラギノ角ゴ ProN"))
	   (set-face-attribute 'default nil :family font-family :height font-height)
	   (let ((name (frame-parameter nil 'font))
		 (jp-font-spec (font-spec :family jp-font-family))
		 (jp-characters '(katakana-jisx0201
				  cp932-2-byte
				  japanese-jisx0212
				  japanese-jisx0213-2
				  japanese-jisx0213.2004-1))
		 (font-spec (font-spec :family font-family))
		 (characters '((?\u00A0 . ?\u00FF)    ; Latin-1
                               (?\u0100 . ?\u017F)    ; Latin Extended-A
                               (?\u0180 . ?\u024F)    ; Latin Extended-B
                               (?\u0250 . ?\u02AF)    ; IPA Extensions
                               (?\u0370 . ?\u03FF)))) ; Greek and Coptic
	     (dolist (jp-character jp-characters)
               (set-fontset-font name jp-character jp-font-spec))
	     (dolist (character characters)
               (set-fontset-font name character font-spec))
	     (add-to-list 'face-font-rescale-alist (cons jp-font-family 1.2)))))
       
       )
      ((string-match "dos" system-configuration)        ;; windows
       ;; (set-face-attribute 'default nil
       ;; 			   :family "Source Code Pro"
       ;; 			   :height 100 )
       )
      ((string-match "freebsd" system-configuration)      ;; FreeBSD
        (message "%s" , "bsd")
       )
      )

;; color-theme
(add-to-list 'custom-theme-load-path
             (file-name-as-directory "~/.emacs.d/site-lisp/replace-colorthemes"))

(load-theme 'desert t t)
(enable-theme 'desert)
(setq system-uses-terminfo nil)

;;tab width
(setq-default tab-width 4)
(setq default-tab-width 4)
(setq-default indent-tabs-mode nil)

;;hide scrollbar
(toggle-scroll-bar nil)

(tool-bar-mode 0)
(menu-bar-mode 0)

;; auto-reload buffer
(global-auto-revert-mode t)
