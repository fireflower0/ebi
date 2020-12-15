(uiop:define-package #:<% @var name %>/app
  (:use #:cl
        #:<% @var name %>/utils)
  (:export #:main))
(in-package #:<% @var name %>/app)

(defparameter *ticks-count* 0)

(defun process-input (keysym)
  (when (sdl2:scancode= (sdl2:scancode-value keysym) :scancode-escape)
    (sdl2:push-event :quit)))

(defun update-game ()
  (while (not (ticks-passed-p (sdl2:get-ticks) (+ *ticks-count* 16)))
    (noop))
  (let ((delta-time (/ (- (sdl2:get-ticks) *ticks-count*) 1000.0)))
    (when (> delta-time 0.05) (setf delta-time 0.05))
    (setf *ticks-count* (sdl2:get-ticks))))

(defun generate-output (renderer)
  (sdl2:set-render-draw-color renderer 0 0 0 255)
  (sdl2:render-clear renderer)
  (sdl2:render-present renderer))

(defun main (&rest args)
  (with-window-renderer (window renderer :width 640 :height 480
                                :title "Lisp Game")
    (sdl2:with-event-loop (:method :poll)
      (:keydown (:keysym keysym) (process-input keysym))
      (:idle ()
             (generate-output renderer)
             (update-game))
      (:quit () t))))
