(defsystem "<% @var name %>"
  :class :package-inferred-system
  :version "0.1.0"
  :author "<% @var author %>"
  :license "<% @var license %>"
  :description "<% @var description %>"
  :depends-on ("sdl2"
               "sdl2-image"
               "sdl2-ttf"
               "<% @var name %>/boot"
               "cl-syntax-annot"
               "envy"
               "mito"))

(register-system-packages "<% @var name %>/boot" '(#:<% @var name %>))
