(uiop:define-package #:2drendering/utils
  (:use #:cl)
  (:export #:with-window-renderer))
(in-package #:2drendering/utils)

(defparameter *title* "Lisp Game")
(defparameter *width*  640)
(defparameter *height* 480)

(defmacro with-window-renderer ((window renderer)
                                &body body)
  `(sdl2:with-init (:video)
     (sdl2:with-window (,window
                        :title ,*title*
                        :w ,*width*
                        :h ,*height*
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
