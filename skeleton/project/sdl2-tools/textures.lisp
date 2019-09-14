(uiop:define-package #:<% @var name %>/sdl2-tools/textures
  (:use #:cl)
  (:export #:textures
           #:textures-renderer
           #:textures-width
           #:textures-height
           #:textures-texture
           #:create-image-texture
           #:create-string-texture
           #:render-texture))
(in-package #:<% @var name %>/sdl2-tools/textures)

(defclass textures ()
  ((renderer :initarg :renderer
             :initform (error "Must supply a renderer")
             :accessor textures-renderer)
   (width    :initarg :width
             :initform 0
             :accessor textures-width)
   (height   :initarg :height
             :initform 0
             :accessor textures-height)
   (texture  :initarg :texture
             :initform nil
             :accessor textures-texture)))

(defmethod create-image-texture ((obj textures) renderer filepath)
  (let ((tex (make-instance 'class-texture :renderer renderer)))
    (with-slots (renderer width height texture) obj
      (let ((surface (sdl2-image:load-image filepath)))
        (setf width  (sdl2:surface-width surface))
        (setf height (sdl2:surface-height surface))
        (sdl2:set-color-key surface
                            :true (sdl2:map-rgb
                                   (sdl2:surface-format surface)
                                   0 0 0))
        (setf texture (sdl2:create-texture-from-surface renderer surface))))
    tex))

(defmethod create-string-texture ((obj textures) renderer font text)
  (let ((tex (make-instance 'class-texture :renderer renderer)))
    (with-slots (renderer width height texture) obj
      (let ((surface  (sdl2-ttf:render-utf8-solid font text #xFF #xFF #xFF 0)))
        (setf width   (sdl2:surface-width surface))
        (setf height  (sdl2:surface-height surface))
        (setf texture (sdl2:create-texture-from-surface renderer surface))))
    tex))

(defmethod render-texture ((obj textures) x-pos y-pos)
  (with-slots (renderer width height texture) obj
    (sdl2:render-copy renderer
                      texture
                      :dest-rect (sdl2:make-rect x-pos y-pos
                                                 width height))))
