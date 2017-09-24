(library (glfw types)
  (export
   GLFWimage
   GLFWimage*
   GLFWwindow*
   GLFWmonitor*
   GLFWerrorfun
   GLFWwindowposfun
   GLFWwindowsizefun
   GLFWwindowclosefun
   GLFWwindowrefreshfun
   GLFWwindowfocusfun
   GLFWwindowiconifyfun
   GLFWframebuffersizefun
   GLFWmousebuttonfun
   GLFWcursorposfun
   GLFWcursorenterfun
   GLFWscrollfun
   GLFWkeyfun
   GLFWcharfun
   GLFWcharmodsfun
   GLFWdropfun
   GLFWmonitorfun
   GLFWjoystickfun)
  (import
   (chezscheme))
  
  ;;  typedef struct GLFWimage
  ;;  {
  ;;    /*! The width, in pixels, of this image.
  ;;    */
  ;;    int width;
  ;;    /*! The height, in pixels, of this image.
  ;;    */
  ;;    int height;
  ;;    /*! The pixel data of this image, arranged left-to-right, top-to-bottom.
  ;;    */
  ;;    unsigned char* pixels;
  ;;  } GLFWimage;
  (define-ftype GLFWimage
    (struct [width int]
	    [height int]
	    [pixels (array 0 char)]))
  (define-ftype GLFWimage* (* GLFWimage))
  (define-ftype GLFWwindow*  uptr)
  (define-ftype GLFWmonitor* uptr)
  (define-ftype GLFWerrorfun            (* (function (int string) void)))
  (define-ftype GLFWwindowposfun        (* (function (GLFWwindow* int int) void)))
  (define-ftype GLFWwindowsizefun       (* (function (GLFWwindow* int int) void)))
  (define-ftype GLFWwindowclosefun      (* (function (GLFWwindow*) void)))
  (define-ftype GLFWwindowrefreshfun    (* (function (GLFWwindow*) void)))
  (define-ftype GLFWwindowfocusfun      (* (function (GLFWwindow* int) void)))
  (define-ftype GLFWwindowiconifyfun    (* (function (GLFWwindow* int) void)))
  (define-ftype GLFWframebuffersizefun  (* (function (GLFWwindow* int int) void)))
  (define-ftype GLFWmousebuttonfun      (* (function (GLFWwindow* int int int) void)))
  (define-ftype GLFWcursorposfun        (* (function (GLFWwindow* double double) void)))
  (define-ftype GLFWcursorenterfun      (* (function (GLFWwindow* int) void)))
  (define-ftype GLFWscrollfun           (* (function (GLFWwindow* double double) void)))
  (define-ftype GLFWkeyfun              (* (function (GLFWwindow* int int int int) void)))
  (define-ftype GLFWcharfun             (* (function (GLFWwindow* unsigned int) void)))
  (define-ftype GLFWcharmodsfun         (* (function (GLFWwindow* unsigned int int) void)))
  (define-ftype GLFWdropfun             (* (function (GLFWwindow* int uptr) void)))
  (define-ftype GLFWmonitorfun          (* (function (GLFWmonitor* int) void)))
  (define-ftype GLFWjoystickfun         (* (function (int int) void)))
  )
