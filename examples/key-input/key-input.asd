(defsystem "key-input"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("sdl2"
               "sdl2-image"
               "sdl2-ttf"
               "key-input/boot"
               "cl-syntax-annot"))

(register-system-packages "key-input/boot" '(#:key-input))
