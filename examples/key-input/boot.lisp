(uiop:define-package #:key-input
  (:use #:cl
        #:key-input/app)
  (:export #:start))
(in-package #:key-input)

(defun start (&rest args)
  (main args))
