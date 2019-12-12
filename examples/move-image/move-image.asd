(defsystem "move-image"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("sdl2"
               "sdl2-image"
               "sdl2-ttf"
               "move-image/boot"
               "cl-syntax-annot"))

(register-system-packages "move-image/boot" '(#:move-image))
