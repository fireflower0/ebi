(in-package #:sdl2-gfx)

#-:gamekit
(cffi:define-foreign-library libsdl2-gfx
  (:unix "libSDL2_gfx-1.0.so.0")
  (:windows "SDL2_gfx.dll")
  (t (:default "libSDL2_gfx")))

#-:gamekit
(cffi:use-foreign-library libsdl2-gfx)