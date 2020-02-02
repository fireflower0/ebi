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

(defun create-string-texture (renderer font-file-path string
                              &key (r 0) (g 0) (b 0) (a 0))
  (let ((surface (sdl2-ttf:render-utf8-solid
                  (sdl2-ttf:open-font font-file-path 50)
                  string r g b a)))
    (values (sdl2:create-texture-from-surface renderer surface)
            (sdl2:surface-width  surface)
            (sdl2:surface-height surface))))
