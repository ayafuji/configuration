(set-language-environment 'Japanese)    ; 日本語環境
(set-default-coding-systems 'utf-8-unix)    ; UTF-8 が基本
(set-terminal-coding-system 'utf-8-unix)    ; emacs -nw も文字化けしない
(setq default-file-name-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(prefer-coding-system 'utf-8-unix)


;; ロックファイル / バックアップファイルを作成しない
(setq create-lockfiles nil)
(setq make-backup-files nil)
(setq delete-auto-save-files t)


;; 対応するカッコを強調表示
(show-paren-mode t)

;; 時間も表示させる。
(display-time)

;; 行番号を常に表示させる
(global-linum-mode)
(setq linum-format "%4d ")

;; 現在行を目立たせる
(setq hl-line-face 'underline)
(global-hl-line-mode)

;; テーマを設定する
(load-theme 'manoj-dark t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

;;
;; undo-tree
;;
;; undo-tree を読み込む
(require 'undo-tree)

;; undo-tree を起動時に有効にする
(global-undo-tree-mode t)

;; M-/ をredo に設定する。
(global-set-key (kbd "M-/") 'undo-tree-redo)

;;
;; Auto Complete
;;
;; auto-complete-config の設定ファイルを読み込む。
(require 'auto-complete-config)

;; よくわからない
(ac-config-default)

;; TABキーで自動補完を有効にする
(ac-set-trigger-key "TAB")

;; auto-complete-mode を起動時に有効にする
(global-auto-complete-mode t)

;;
;; backup の保存先
;;
(setq backup-directory-alist
      (cons (cons ".*" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))


(setq auto-save-file-name-transforms
        `((".*", (expand-file-name "~/.emacs.d/backup/") t)))

(require 'undo-tree)
(global-undo-tree-mode t)
(global-set-key (kbd "M-/") 'undo-tree-redo)

(require 'anything-startup nil t)

(setq-default tab-width 4 indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; ターミナル日本語コード euc
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(set-language-environment "Japanese")


(progn
  (require 'whitespace)
  (setq whitespace-style
        '(
          face ; faceで可視化
          trailing ; 行末
          tabs ; タブ
          spaces ; スペース
          space-mark ; 表示のマッピング
          tab-mark
          ))
  (setq whitespace-display-mappings
        '(
          (space-mark ?\u3000 [?\u2423])
          (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])
          ))
  (setq whitespace-trailing-regexp  "\\([ \u00A0]+\\)$")
  (setq whitespace-space-regexp "\\(\u3000+\\)")
  (set-face-attribute 'whitespace-trailing nil
                      :foreground "RoyalBlue4"
                      :background "RoyalBlue4"
                      :underline nil)
  (set-face-attribute 'whitespace-tab nil
                      :foreground "yellow4"
                      :background "yellow4"
                      :underline nil)
  (set-face-attribute 'whitespace-space nil
                      :foreground "gray40"
                      :background "gray20"
                      :underline nil)
  (global-whitespace-mode t)
  )
(keyboard-translate ?\C-h ?\C-?)
