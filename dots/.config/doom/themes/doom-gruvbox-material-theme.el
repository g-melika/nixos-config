;;; doom-gruvbox-material-theme.el --- doom-gruvbox faces with Gruvbox Material palettes -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: May 1, 2019 (#277)
;; Author: JongW <https://github.com/JongW>
;; Maintainer:
;; Source: https://github.com/morhetz/gruvbox
;; Palette: https://github.com/sainnhe/gruvbox-material
;;
;;; Commentary:
;;; Code:

(require 'doom-themes)

;; Compiler pacifier
(defvar modeline-bg)


;;
;;; Variables

(defgroup doom-gruvbox-material-theme nil
  "Options for doom-gruvbox-material."
  :group 'doom-themes)

(defcustom doom-gruvbox-material-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-gruvbox-material-theme
  :type 'boolean)

(defcustom doom-gruvbox-material-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-gruvbox-material-theme
  :type '(choice integer boolean))

(defcustom doom-gruvbox-material-background "medium"
  "A choice of \"hard\" or \"soft\" can be used to change the
background contrast. All other values default to \"medium\"."
  :group 'doom-gruvbox-material-theme
  :type  'string)

(defcustom doom-gruvbox-material-palette "material"
  "Compatibility option. This theme only uses the Gruvbox Material palette."
  :group 'doom-gruvbox-material-theme
  :type 'string)


;;
;;; Theme definition

(def-doom-theme doom-gruvbox-material
  "Doom Gruvbox faces using Gruvbox Material colors."
  :family 'doom-gruvbox-material
  :background-mode 'dark

  ;; name        gui       256       16
  ((bg
    (cond ((equal doom-gruvbox-material-background "hard") '("#1d2021" "#1e1e1e" nil)) ; bg0 hard
          ((equal doom-gruvbox-material-background "soft") '("#32302f" "#323232" nil)) ; bg0 soft
          (t                                                 '("#282828" "#282828" nil)))) ; bg0 medium
   (bg-alt
    (cond ((equal doom-gruvbox-material-background "hard") '("#282828" "#282828" nil)) ; bg1 hard
          ((equal doom-gruvbox-material-background "soft") '("#3c3836" "#383838" nil)) ; bg1 soft
          (t                                                 '("#32302f" "#323232" nil)))) ; bg1 medium
   (bg-alt2
    (cond ((equal doom-gruvbox-material-background "hard") '("#3c3836" "#383838" "brown")) ; bg2 hard
          ((equal doom-gruvbox-material-background "soft") '("#504945" "#504945" "brown")) ; bg2 soft
          (t                                                 '("#45403d" "#45403d" "brown")))) ; bg2 medium

   (base0
    (cond ((equal doom-gruvbox-material-background "hard") '("#1d2021" "black" "black"))
          ((equal doom-gruvbox-material-background "soft") '("#32302f" "#323232" "black"))
          (t                                                 '("#282828" "#282828" "black"))))
   (base1 bg-alt)
   (base2 bg-alt2)
   (base3
    (cond ((equal doom-gruvbox-material-background "hard") '("#45403d" "#45403d" "brightblack"))
          ((equal doom-gruvbox-material-background "soft") '("#665c54" "#5c5c5c" "brightblack"))
          (t                                                 '("#5a524c" "#5c5c5c" "brightblack"))))
   (base4
    (cond ((equal doom-gruvbox-material-background "hard") '("#504945" "#504945" "brightblack"))
          ((equal doom-gruvbox-material-background "soft") '("#5a524c" "#5c5c5c" "brightblack"))
          (t                                                 '("#504945" "#504945" "brightblack"))))
   (base5      '("#7c6f64" "#6f6f6f" "brightblack")) ; grey0
   (base6      '("#928374" "#909090" "brightblack")) ; grey1
   (base7      '("#a89984" "#a8a8a8" "brightblack")) ; grey2
   (base8      '("#d4be98" "#dfdfdf" "brightwhite")) ; fg0
   (fg         '("#d4be98" "#dfdfdf" "brightwhite")) ; fg0
   (fg-alt     '("#ddc7a1" "#dfdfdf" "brightwhite")) ; fg1

   ;; Gruvbox Material colors
   (grey        '("#928374" "#909090" "brightblack"))
   (red         '("#ea6962" "#e74c3c" "red"))
   (magenta     '("#d3869b" "#d3869b" "magenta"))
   (violet      '("#d3869b" "#d3869b" "brightmagenta"))
   (orange      '("#e78a4e" "#d7875f" "orange"))
   (yellow      '("#d8a657" "#d7af5f" "yellow"))
   (dark-yellow '("#c18f41" "#af875f" "yellow"))
   (teal        '("#89b482" "#87af87" "green"))
   (green       '("#a9b665" "#afaf5f" "green"))
   (dark-green  '("#8f9a52" "#87875f" "green"))
   (blue        '("#7daea3" "#87afaf" "brightblue"))
   (dark-blue   '("#68948a" "#5f8787" "blue"))
   (cyan        '("#89b482" "#87af87" "brightcyan"))
   (my-black    bg-alt)
   (dark-cyan   '("#72966c" "#5f875f" "cyan"))

   ;; face categories
   (highlight      yellow)
   (vertical-bar   bg-alt2)
   (selection      bg-alt2)
   (builtin        orange)
   (comments       (if doom-gruvbox-material-brighter-comments magenta grey))
   (doc-comments   (if doom-gruvbox-material-brighter-comments (doom-lighten magenta 0.2) (doom-lighten fg-alt 0.25)))
   (constants      violet)
   (functions      green)
   (keywords       red)
   (methods        green)
   (operators      fg)
   (type           yellow)
   (strings        green)
   (variables      blue)
   (numbers        violet)
   (region         bg-alt2)
   (error          red)
   (warning        yellow)
   (success        green)

   (vc-modified    (doom-darken cyan 0.15))
   (vc-added       (doom-darken green 0.15))
   (vc-deleted     (doom-darken red 0.15))

   ;; custom categories
   (-modeline-pad
    (when doom-gruvbox-material-padded-modeline
      (if (integerp doom-gruvbox-material-padded-modeline)
          doom-gruvbox-material-padded-modeline
        4)))
   (modeline-bg bg-alt2)
   (modeline-fg (doom-lighten fg-alt 0.25))
   (modeline-inactive-bg (doom-darken modeline-bg 0.15))
   (modeline-inactive-fg base6)

   (org-quote `(,(doom-lighten (car bg) 0.05) "#1f1f1f")))


  ;;;; Base theme face overrides
  ((button :foreground cyan :underline t :weight 'bold)
   (cursor :background fg :foreground bg)
   (hl-line :background bg)
   ((line-number &override) :foreground base5)
   ((line-number-current-line &override) :background bg :foreground yellow)
   (isearch :foreground base0 :background orange)
   (lazy-highlight :background yellow :foreground base0 :distant-foreground base0 :bold bold)
   ((link &override) :foreground violet)
   (minibuffer-prompt :foreground cyan)
   (mode-line
    :background my-black :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background bg :foreground base4
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-inactive-bg)))

   ;;;; company
   (company-preview-common :foreground cyan)
   (company-tooltip-common :foreground cyan)
   (company-tooltip-common-selection :foreground cyan)
   (company-tooltip-annotation :foreground cyan)
   (company-tooltip-annotation-selection :foreground cyan)
   (company-scrollbar-bg :background base3)
   (company-scrollbar-fg :background cyan)
   (company-tooltip-selection :background bg-alt2)
   (company-tooltip-mouse :background bg-alt2 :foreground nil)
   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground keywords)
   ;;;; doom-emacs
   (+workspace-tab-selected-face :background dark-green :foreground "white")
   ;;;; doom-modeline
   (doom-modeline-project-dir :bold t :foreground cyan)
   (doom-modeline-buffer-path :inherit 'bold :foreground green)
   (doom-modeline-buffer-file :inherit 'bold :foreground fg)
   (doom-modeline-buffer-modified :inherit 'bold :foreground yellow)
   (doom-modeline-error :background bg)
   (doom-modeline-buffer-major-mode :foreground green :bold t)
   (doom-modeline-info :bold t :foreground cyan)
   (doom-modeline-bar :background dark-green)
   (doom-modeline-panel :background dark-green :foreground fg)
   ;;;; doom-themes
   (doom-themes-neotree-file-face :foreground fg)
   (doom-themes-neotree-hidden-file-face :foreground (doom-lighten fg-alt 0.25))
   (doom-themes-neotree-media-file-face :foreground (doom-lighten fg-alt 0.25))
   ;;;; emacs-lisp-mode
   (highlight-quoted-symbol :foreground dark-cyan)
   ;;;; ediff <built-in>
   (ediff-fine-diff-A    :background (doom-blend red bg 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-blend red bg 0.2))
   ;;;; evil
   (evil-search-highlight-persist-highlight-face :background yellow)
   (evil-ex-substitute-replacement :foreground cyan :strike-through nil :inherit 'evil-ex-substitute-matches)
   ;;;; evil-snipe
   (evil-snipe-first-match-face :foreground "white" :background yellow)
   (evil-snipe-matches-face     :foreground yellow :bold t :underline t)
   ;;;; flycheck
   (flycheck-error   :underline `(:style wave :color ,red)    :background base3)
   (flycheck-warning :underline `(:style wave :color ,yellow) :background base3)
   (flycheck-info    :underline `(:style wave :color ,blue)   :background base3)
   ;;;; dired
   (dired-directory :foreground cyan)
   (dired-marked :foreground yellow)
   (dired-symlink :foreground cyan)
   (dired-header :foreground cyan)
   ;;;; helm
   (helm-swoop-target-line-face :foreground magenta :inverse-video t)
   ;;;; highlight-thing
   (highlight-thing :background (doom-lighten base3 0.03) :distant-foreground fg-alt)
   ;;;; highlight-symbol
   (highlight-symbol-face :background (doom-lighten base3 0.03) :distant-foreground fg-alt)
   ;;;; ivy
   (ivy-current-match :background bg-alt2)
   (ivy-subdir :background nil :foreground cyan)
   (ivy-action :background nil :foreground cyan)
   (ivy-grep-line-number :background nil :foreground cyan)
   (ivy-minibuffer-match-face-1 :background nil :foreground yellow)
   (ivy-minibuffer-match-face-2 :background nil :foreground yellow)
   (ivy-minibuffer-match-highlight :foreground cyan)
   (counsel-key-binding :foreground cyan)
   ;;;; ivy-posframe
   (ivy-posframe :background base3)
   (ivy-posframe-border :background base1)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground dark-cyan)
   ;;;; magit
   (magit-section-heading             :foreground cyan :weight 'bold)
   (magit-branch-current              :underline green :inherit 'magit-branch-local)
   (magit-diff-hunk-heading           :background base3 :foreground fg-alt)
   (magit-diff-hunk-heading-highlight :background bg-alt2 :foreground fg)
   (magit-diff-context                :foreground base3 :foreground fg-alt)
   ;;;; markdown-mode
   (markdown-header-face :inherit 'bold :foreground green)
   (markdown-header-delimiter-face :foreground orange)
   (markdown-blockquote-face :inherit 'italic :foreground grey)
   (markdown-list-face :foreground grey)
   (markdown-url-face :foreground violet)
   (markdown-pre-face  :foreground cyan)
   (markdown-link-face :inherit 'underline :foreground grey)
   ((markdown-code-face &override) :background (doom-lighten base2 0.045))
   ;;;; mu4e-view
   (mu4e-header-key-face :foreground red :weight 'bold)
   ;;;; neotree
   (neo-root-dir-face   :foreground cyan)
   (doom-neotree-dir-face :foreground cyan)
   (neo-dir-link-face   :foreground cyan)
   (neo-expand-btn-face :foreground magenta)
   ;;;; outline <built-in>
   ((outline-1 &override) :foreground violet)
   ((outline-2 &override) :foreground cyan)
   ((outline-3 &override) :foreground green)
   ((outline-4 &override) :foreground (doom-lighten violet 0.2))
   ((outline-5 &override) :foreground (doom-lighten dark-cyan 0.25))
   ((outline-6 &override) :foreground (doom-lighten violet 0.4))
   ((outline-7 &override) :foreground (doom-lighten dark-cyan 0.5))
   ((outline-8 &override) :foreground (doom-lighten violet 0.6))
   ; ((outline-1 &override) :foreground green)
   ; ((outline-2 &override) :foreground green)
   ; ((outline-3 &override) :foreground yellow)
   ; ((outline-4 &override) :foreground yellow)
   ; ((outline-5 &override) :foreground dark-yellow)
   ; ((outline-6 &override) :foreground dark-yellow)
   ;;;; org <built-in>
   ((org-code &override) :foreground orange)
   (org-date :foreground green)
   (org-document-info :foreground red)
   (org-document-title :foreground red)
   (org-drawer :foreground (doom-lighten cyan 0.4))
   (org-ellipsis :underline nil :foreground orange)
   (org-formula :foreground green)
   (org-meta-line :foreground comments)
   (org-list-dt :foreground cyan)
   ; (org-list-dt :foreground yellow)
   ((org-quote &override) :inherit 'italic :foreground base7 :background org-quote)
   (org-table :foreground cyan)
   (org-tag :foreground (doom-darken comments 0.15) :weight 'normal)
   ; (org-tag :foreground yellow :bold nil)
   (org-todo :foreground green :bold 'inherit)
   ; (org-todo :foreground yellow :bold 'inherit)
   (org-verbatim :foreground yellow)
   ;;;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground orange)
   (rainbow-delimiters-depth-2-face :foreground magenta)
   (rainbow-delimiters-depth-3-face :foreground green)
   (rainbow-delimiters-depth-4-face :foreground blue)
   ;;;; show-paren <built-in>
   ((show-paren-match &override) :foreground 'unspecified :background base5 :bold t)
   ((show-paren-mismatch &override) :foreground 'unspecified :background "red")
   ;;;; swiper
   (swiper-line-face :background bg-alt2)
   ;;;; undo-tree
   (undo-tree-visualizer-active-branch-face :foreground cyan)
   (undo-tree-visualizer-current-face :foreground yellow)
   ;;;; vimish-fold
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background bg-alt2 :weight 'light)
   ((vimish-fold-mouse-face &override) :foreground "white" :background yellow :weight 'light)
   ((vimish-fold-fringe &override) :foreground magenta :background magenta)
   ;;;; web-mode
   (web-mode-html-tag-bracket-face :foreground blue)
   (web-mode-html-tag-face         :foreground cyan)
   (web-mode-html-attr-name-face   :foreground cyan)
   (web-mode-json-key-face         :foreground green)
   (web-mode-json-context-face     :foreground cyan)
   ;;;; which-key
   (which-key-key-face                   :foreground green)
   (which-key-group-description-face     :foreground red)
   (which-key-command-description-face   :foreground blue)
   (which-key-local-map-description-face :foreground orange))

  ;;;; Base theme variable overrides
  ;; ()
  )

;;; doom-gruvbox-theme.el ends here
