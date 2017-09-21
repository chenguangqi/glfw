#! /usr/bin/env scheme-script

(import
 (chezscheme)
 (glfw glfw))

;;(display (library-directories))


(load-shared-object
 "/home/dulangci/repositories/glfw-3.2.1/build/src/libglfw.so")

(display (glfw-get-version-string))
(newline)


