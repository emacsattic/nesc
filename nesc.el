;;; necs.el --- necs mode

;; Copyright (C) 2002 by Free Software Foundation, Inc.

;; Author: Dennis Haney <[EMAIL PROTECTED]>
;; Keywords: c, languages

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
;; Boston, MA 02111-1307, USA.

;;; Commentary:

;;; put this in your .emacs:

;;; (autoload 'nesc-mode "nesc"
;;;  "Major mode for editing Nesc code." t)
;;;(setq auto-mode-alist (cons '( "\\.nc\\'" . nesc-mode ) auto-mode-alist ))

;;; Code:

(require 'cc-mode)
(require 'font-lock)
(require 'derived)

(defvar nesc-font-lock-keywords-1)

(let* ((nesc-keywords
        (eval-when-compile
          (regexp-opt
           '("and" "or" "not" "command" "includes" "signal"
             "interface" "components" "call" "as" "default"
             "configuration" "implementation" "task" "post"
             "module" "provides" "uses" "event") t))))

  (setq nesc-font-lock-keywords-1
        (list (concat "\\<" nesc-keywords "\\>"))))

(defconst nesc-font-lock-keywords
  (append nesc-font-lock-keywords-1
   c++-font-lock-keywords-2))

(define-derived-mode nesc-mode c-mode "Nesc"
  "Major mode for editing nesc files"

  (make-local-variable 'font-lock-defaults)
  (setq font-lock-defaults
        '(nesc-font-lock-keywords
          nil nil ((?_ . "w"))
          beginning-of-defun
          (font-lock-mark-block-function . mark-defun))))

(provide 'nesc-mode)
;;; necs.el ends here
