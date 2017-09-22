(library (glfw callbacks)
  (export
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
   GLFWjoystickfun

   callback
   define-callback

   glfwSetErrorCallback
   glfwSetMonitorCallback
   glfwSetWindowPosCallback
   glfwSetWindowSizeCallback
   glfwSetWindowCloseCallback
   glfwSetWindowRefreshCallback
   glfwSetWindowFocusCallback
   glfwSetWindowIconifyCallback
   glfwSetFramebufferSizeCallback
   glfwSetKeyCallback
   glfwSetCharCallback
   glfwSetCharModsCallback
   glfwSetMouseButtonCallback
   glfwSetCursorPosCallback
   glfwSetCursorEnterCallback
   glfwSetScrollCallback
   glfwSetDropCallback
   glfwSetJoystickCallback
   
   )
  (import (scheme))
  
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

  
  (define-syntax callback
    (syntax-rules ()
      [(_ p (args ...) ret)
       (let ([code (foreign-callable p (args ...) ret)])
	 (lock-object code)
	 (foreign-callable-entry-point code))]))

  (define-syntax define-callback
    (syntax-rules ()
      [(_ name (args ...) ret)
       (define (name p)
	 (let* ([func `(foreign-procedure ,(symbol->string name) (args ...) ret)]
		[newcb `(callback p (,@(cadadr (ftype-pointer-ftype (make-ftype-pointer ret 0)))) void)]
		[oldcb (func newcb)])
	   (when oldcb
		 (unlock-object (foreign-callable-code-object oldcb)))))]))

  ;;   GLFWAPI GLFWerrorfun glfwSetErrorCallback(GLFWerrorfun cbfun);
  ;;   GLFWAPI GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun cbfun);
  ;;   GLFWAPI GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* window, GLFWwindowposfun cbfun);
  ;;   GLFWAPI GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* window, GLFWwindowsizefun cbfun);
  ;;   GLFWAPI GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* window, GLFWwindowclosefun cbfun);
  ;;   GLFWAPI GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* window, GLFWwindowrefreshfun cbfun);
  ;;   GLFWAPI GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* window, GLFWwindowfocusfun cbfun);
  ;;   GLFWAPI GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* window, GLFWwindowiconifyfun cbfun);
  ;;   GLFWAPI GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* window, GLFWframebuffersizefun cbfun);
  ;;   GLFWAPI GLFWkeyfun glfwSetKeyCallback(GLFWwindow* window, GLFWkeyfun cbfun);
  ;;   GLFWAPI GLFWcharfun glfwSetCharCallback(GLFWwindow* window, GLFWcharfun cbfun);
  ;;   GLFWAPI GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* window, GLFWcharmodsfun cbfun);
  ;;   GLFWAPI GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* window, GLFWmousebuttonfun cbfun);
  ;;   GLFWAPI GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* window, GLFWcursorposfun cbfun);
  ;;   GLFWAPI GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* window, GLFWcursorenterfun cbfun);
  ;;   GLFWAPI GLFWscrollfun glfwSetScrollCallback(GLFWwindow* window, GLFWscrollfun cbfun);
  ;;   GLFWAPI GLFWdropfun glfwSetDropCallback(GLFWwindow* window, GLFWdropfun cbfun);
  ;;   GLFWAPI GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun cbfun);
  
  (define-callback glfwSetErrorCallback (GLFWerrorfun) GLFWerrorfun)
  (define-callback glfwSetMonitorCallback (GLFWmonitorfun) GLFWmonitorfun)
  (define-callback glfwSetWindowPosCallback (GLFWwindow*  GLFWwindowposfun) GLFWwindowposfun)
  (define-callback glfwSetWindowSizeCallback (GLFWwindow* GLFWwindowsizefun) GLFWwindowsizefun)
  (define-callback glfwSetWindowCloseCallback (GLFWwindow* GLFWwindowclosefun) GLFWwindowclosefun)
  (define-callback glfwSetWindowRefreshCallback (GLFWwindow* GLFWwindowrefreshfun) GLFWwindowrefreshfun)
  (define-callback glfwSetWindowFocusCallback (GLFWwindow* GLFWwindowfocusfun) GLFWwindowfocusfun)
  (define-callback glfwSetWindowIconifyCallback (GLFWwindow* GLFWwindowiconifyfun) GLFWwindowiconifyfun)
  (define-callback glfwSetFramebufferSizeCallback (GLFWwindow* GLFWframebuffersizefun) GLFWframebuffersizefun)
  (define-callback glfwSetKeyCallback (GLFWwindow* GLFWkeyfun) GLFWkeyfun)
  (define-callback glfwSetCharCallback (GLFWwindow* GLFWcharfun) GLFWcharfun)
  (define-callback glfwSetCharModsCallback (GLFWwindow* GLFWcharmodsfun) GLFWcharmodsfun)
  (define-callback glfwSetMouseButtonCallback (GLFWwindow* GLFWmousebuttonfun) GLFWmousebuttonfun)
  (define-callback glfwSetCursorPosCallback (GLFWwindow* GLFWcursorposfun) GLFWcursorposfun)
  (define-callback glfwSetCursorEnterCallback (GLFWwindow* GLFWcursorenterfun) GLFWcursorenterfun)
  (define-callback glfwSetScrollCallback (GLFWwindow* GLFWscrollfun) GLFWscrollfun)
  (define-callback glfwSetDropCallback (GLFWwindow* GLFWdropfun) GLFWdropfun)
  (define-callback glfwSetJoystickCallback (GLFWjoystickfun) GLFWjoystickfun)

 
  )
