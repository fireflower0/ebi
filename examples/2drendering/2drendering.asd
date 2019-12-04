(defsystem "2drendering"
  :class :package-inferred-system
  :version "0.1.0"
  :author ""
  :license ""
  :description ""
  :depends-on ("sdl2"
               "sdl2-image"
               "sdl2-ttf"
               "2drendering/boot"
               "cl-syntax-annot"))

(register-system-packages "2drendering/boot" '(#:2drendering))
