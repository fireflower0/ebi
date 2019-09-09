(uiop:define-package #:<% @var name %>/app
  (:use #:cl
        #:<% @var name %>/utils)
  (:export #:main))
(in-package #:<% @var name %>/app)

(defun main (&rest args)
  (with-window-renderer (window renderer)
    (sdl2:with-event-loop (:method :poll)
      (:keydown (:keysym keysym)
                (if (sdl2:scancode= (sdl2:scancode-value keysym)
                                    :scancode-escape)
                    (sdl2:push-event :quit)))
      (:idle ()
             (sdl2:set-render-draw-color renderer 0 0 0 255)
             (sdl2:render-clear renderer)
             (sdl2:render-present renderer))
      (:quit () t))))
