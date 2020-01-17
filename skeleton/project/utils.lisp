(uiop:define-package #:<% @var name %>/utils
  (:use #:cl)
  (:export #:with-window-renderer
           #:*screen-width*
           #:*screen-height*))
(in-package #:<% @var name %>/utils)

(defparameter *screen-width* nil)
(defparameter *screen-height* nil)

(defmacro with-window-renderer
    ((window renderer &key width height title)
     &body body)
  (setf *screen-width* width *screen-height* height)
  `(sdl2:with-init (:video)
     (sdl2:with-window (,window
                        :title ,title :w ,width :h ,height
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
