(cl:in-package :sdl2-ffi)

(autowrap:c-include
 '(sdl2-gfx autowrap-spec "SDL2_gfx.h")
  :accessor-package :sdl2-ffi.accessors
  :function-package :sdl2-ffi.functions
  :spec-path '(sdl2-gfx autowrap-spec)
  :exclude-sources ("/usr/local/lib/clang/([^/]*)/include/(?!stddef.h)"
                    "/usr/include/"
                    "/usr/include/arm-linux-gnueabihf"
                    "/usr/include/X11/")
  :include-sources ("SDL2_gfxPrimitives.h")
  :exclude-definitions ("SDL_LogMessageV"
                        "SDL_vsnprintf"
                        "_inline$"
                        "^_mm_")
  :include-definitions ("^XID$" "^Window$" "^Display$" "^_XDisplay$")
  :symbol-exceptions ()
  :release-p cl:t
  :no-accessors cl:t)
