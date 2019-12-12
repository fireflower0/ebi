(uiop:define-package #:move-image
  (:use #:cl
        #:move-image/app)
  (:export #:start))
(in-package #:move-image)

(defun start (&rest args)
  (main args))
