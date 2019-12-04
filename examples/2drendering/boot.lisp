(uiop:define-package #:2drendering
  (:use #:cl
        #:2drendering/app)
  (:export #:start))
(in-package #:2drendering)

(defun start (&rest args)
  (main args))
