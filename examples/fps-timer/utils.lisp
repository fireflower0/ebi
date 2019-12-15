(uiop:define-package #:fps-timer/utils
  (:use #:cl)
  (:export #:with-window-renderer
           #:*screen-width*
           #:*screen-height*))
(in-package #:fps-timer/utils)

(defparameter *title* "Lisp Game")
(defparameter *screen-width*  640)
(defparameter *screen-height* 480)

(defmacro with-window-renderer ((window renderer)
                                &body body)
  `(sdl2:with-init (:video)
     (sdl2:with-window (,window
                        :title ,*title*
                        :w ,*screen-width*
                        :h ,*screen-height*
                        :flags '(:shown))
       (sdl2:with-renderer (,renderer
                            ,window
                            :index -1
                            :flags '(:accelerated :presentvsync))
         (sdl2-image:init '(:png))
         (sdl2-ttf:init)
         ,@body
         (sdl2-image:quit)
         (sdl2-ttf:quit)))))
