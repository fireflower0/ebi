(uiop:define-package #:fps-timer
  (:use #:cl
        #:fps-timer/app)
  (:export #:start))
(in-package #:fps-timer)

(defun start (&rest args)
  (main args))
