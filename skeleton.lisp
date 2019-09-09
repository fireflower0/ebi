(defpackage #:lisp-game-editor/skeleton
  (:use #:cl)
  (:import-from #:cl-project)
  (:export #:make-project))
(in-package #:lisp-game-editor/skeleton)

(defvar *skeleton-directory*
  (asdf:system-relative-pathname :lisp-game-editor #P"skeleton/project/"))

(defun make-project (path
                     &rest params
                     &key description author license &allow-other-keys)
  (declare (ignore description author license))
  (let ((cl-project:*skeleton-directory* *skeleton-directory*))
    (apply #'cl-project:make-project path params)))
