;;;; sdl2.asd

(asdf:defsystem #:sdl2-gfx
  :description "Bindings for SDL2_gfx using cl-autowrap."
  :author "Wilfredo Velázquez-Rodríguez <zulu.inuoe@gmail.com>"
  :license "MIT"
  :depends-on (:cl-autowrap
               :cl-plus-c
               :cl-ppcre
               :sdl2)
  :pathname "src"
  :serial t

  :components
  ((:module autowrap-spec
    :pathname "spec"
    :components
    ((:static-file "SDL2_gfx.h")
     (:static-file "SDL2_gfx.arm-pc-linux-gnu.spec")
     (:static-file "SDL2_gfx.i386-unknown-freebsd.spec")
     (:static-file "SDL2_gfx.i386-unknown-openbsd.spec")
     (:static-file "SDL2_gfx.i686-apple-darwin9.spec")
     (:static-file "SDL2_gfx.i686-pc-linux-gnu.spec")
     (:static-file "SDL2_gfx.i686-pc-windows-msvc.spec")
     (:static-file "SDL2_gfx.x86_64-apple-darwin9.spec")
     (:static-file "SDL2_gfx.x86_64-pc-linux-gnu.spec")
     (:static-file "SDL2_gfx.x86_64-pc-windows-msvc.spec")
     (:static-file "SDL2_gfx.x86_64-unknown-freebsd.spec")
     (:static-file "SDL2_gfx.x86_64-unknown-openbsd.spec")))
   (:file "package")
   (:file "library")
   (:file "autowrap")))