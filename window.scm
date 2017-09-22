(library (glfw window)
  (export
   glfwCreateWindow
   glfwWindowHint
   glfwDestroyWindow
   glfwWindowShouldClose
   glfwSetWindowShouldClose
   glfwSetWindowTitle
   glfwSetWindowIcon
   glfwGetWindowPos
   glfwSetWindowPos
   glfwGetWindowSize
   glfwSetWindowSize
   glfwSetWindowSizeLimits
   glfwSetWindowAspectRatio
;;   glfwGetFramebufferSize
;;   glfwGetWindowFrameSize
;;   glfwIconifyWindow
;;   glfwRestoreWindow
;;   glfwMaximizeWindow
;;   glfwShowWindow
;;   glfwHideWindow
;;   glfwFocusWindow
;;   glfwGetWindowAttrib
;;   glfwGetWindowMonitor
;;   glfwSetWindowMonitor
;;   glfwSetWindowUserPointer
;;   glfwGetWindowUserPointer
;;   glfwSetWindowPosCallback
;;   glfwSetWindowSizeCallback
;;   glfwSetWindowCloseCallback
;;   glfwSetWindowRefreshCallback
;;   glfwSetWindowFocusCallback
;;   glfwSetWindowIconifyCallback
;;   glfwSetFramebufferSizeCallback
;;   glfwPollEvents
;;   glfwWaitEvents
;;   glfwWaitEventsTimeout
;;   glfwPostEmptyEvent
   )
  (import
   (scheme)
   (glfw types))



  ;; GLFWAPI GLFWwindow* glfwCreateWindow(int width, int height,
  ;;					   const char* title,
  ;;					   GLFWmonitor* monitor,
  ;;					   GLFWwindow* share)
  (define glfwCreateWindow
    (foreign-procedure "glfwCreateWindow" (int int string GLFWmonitor* GLFWwindow*) GLFWwindow*))
  
  ;; GLFWAPI void glfwWindowHint(int hint, int value)
  (define glfwWindowHint
    (foreign-procedure "glfwWindowHint" (int int) void))
  
  ;; GLFWAPI void glfwDestroyWindow(GLFWwindow* handle)
  (define glfwDestroyWindow
    (foreign-procedure "glfwDestroyWindow" (GLFWwindow*) void))
  
  ;; GLFWAPI int glfwWindowShouldClose(GLFWwindow* handle)
  (define glfwWindowShouldClose
    (foreign-procedure "glfwWindowShouldClose" (GLFWwindow*) int))
  
  ;; GLFWAPI void glfwSetWindowShouldClose(GLFWwindow* handle, int value)
  (define glfwSetWindowShouldClose
    (foreign-procedure "glfwSetWindowShouldClose" (GLFWwindow* int) void))
  
  ;; GLFWAPI void glfwSetWindowTitle(GLFWwindow* handle, const char* title)
  (define glfwSetWindowTitle
    (foreign-procedure "glfwSetWindowTitle" (GLFWwindow* string) void))
  
  ;; GLFWAPI void glfwSetWindowIcon(GLFWwindow* handle,
  ;;					     int count, const GLFWimage* images)
  (define glfwSetWindowIcon
    (foreign-procedure "glfwSetWindowIcon" (GLFWwindow* int (* GLFWimage)) void))
  
  ;; GLFWAPI void glfwGetWindowPos(GLFWwindow* handle, int* xpos, int* ypos)
  (define glfwGetWindowPos
    (lambda (handle)
      (let ([xpos (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	    [ypos (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))])
	((foreign-procedure "glfwGetWindowPos" (GLFWwindow* (* int) (* int)) void) handle xpos ypos)
	(let ([xposval (ftype-ref int () xpos)]
	      [yposval (ftype-ref int () ypos)])
	  (foreign-free xpos)
	  (foreign-free ypos)
	  (values xposval yposval)))))
  
  ;;  GLFWAPI void glfwSetWindowPos(GLFWwindow* handle, int xpos, int ypos)
  (define glfwSetWindowPos
    (foreign-procedure "glfwSetWindowPos" (GLFWwindow* int int) void))
    
  ;;  GLFWAPI void glfwGetWindowSize(GLFWwindow* handle, int* width, int* height)
  (define glfwGetWindowSize
    (lambda (handle)
      (let ([width (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	    [height (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))])
	((foreign-procedure "glfwGetWindowSize" (GLFWwindow* (* int) (* int)) void) handle width height)
	(let ([widthval (ftype-ref int () width)]
	      [heightval (ftype-ref int () height)])
	  (foreign-free width)
	  (foreign-free height)
	  (values widthval heightval)))))
  
  ;;  GLFWAPI void glfwSetWindowSize(GLFWwindow* handle, int width, int height)
  (define glfwSetWindowSize
    (foreign-procedure "glfwSetWindowSize" (GLFWwindow* int int) void))
  
  ;;  GLFWAPI void glfwSetWindowSizeLimits(GLFWwindow* handle,
  ;;						   int minwidth, int minheight,
  ;;						   int maxwidth, int maxheight)
  (define glfwSetWindowSizeLimits
    (foreign-procedure "glfwSetWindowSizeLimits" (GLFWwindow* int int int int) void))
  
  ;;  GLFWAPI void glfwSetWindowAspectRatio(GLFWwindow* handle, int numer, int denom)
  (define glfwSetWindowAspectRatio
    (foreign-procedure "glfwSetWindowAspectRatio" (GLFWwindow* int int) void))

  ;;  GLFWAPI void glfwGetFramebufferSize(GLFWwindow* handle, int* width, int* height)
  (define glfwGetFramebufferSize
    (lambda (handle)
      (let ([width (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	    [height (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))])
	((foreign-procedure "glfwGetFramebufferSize" (GLFWwindow* (* int) (* int)) void) handle width height)
	(let ([widthval (ftype-ref int () width)]
	      [heightval (ftype-ref int () height)])
	  (foreign-free width)
	  (foreign-free height)
	  (values widthval heightval)))))
  
  ;;  GLFWAPI void glfwGetWindowFrameSize(GLFWwindow* handle,
  ;;						  int* left, int* top,
  ;;						  int* right, int* bottom)
  (define glfwGetWindowFrameSize
    (lambda (handle)
      (let ([left   (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	    [top    (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	    [right  (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	    [bottom (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))])
	((foreign-procedure "glfwGetWindowFrameSize" (GLFWwindow* (* int) (* int) (* int) (* int)) void) handle left top right bottom)
	(let ([leftval   (ftype-ref int () left)]
	      [topval    (ftype-ref int () top)]
	      [rightval  (ftype-ref int () right)]
	      [bottomval (ftype-ref int () bottom)])
	  (foreign-free left)
	  (foreign-free top)
	  (foreign-free right)
	  (foreign-free bottom)
	  (values leftval topval rightval bottomval)))))
  
  ;;  GLFWAPI void glfwIconifyWindow(GLFWwindow* handle)
  (define glfwIconifyWindow
    (foreign-procedure "glfwIconifyWindow" (GLFWwindow*) void))
  
  ;;  GLFWAPI void glfwRestoreWindow(GLFWwindow* handle)
  (define glfwRestoreWindow
    (foreign-procedure "glfwRestoreWindow" (GLFWwindow*) void))
  
  ;;  GLFWAPI void glfwMaximizeWindow(GLFWwindow* handle)
  (define glfwMaximizeWindow
    (foreign-procedure "glfwMaximizeWindow" (GLFWwindow*) void))
  
  ;;  GLFWAPI void glfwShowWindow(GLFWwindow* handle)
  (define glfwShowWindow
    (foreign-procedure "glfwShowWindow" (GLFWwindow*) void))
  
  ;;  GLFWAPI void glfwHideWindow(GLFWwindow* handle)
  (define glfwHideWindow
    (foreign-procedure "glfwHideWindow" (GLFWwindow*) void))
  
  ;;  GLFWAPI void glfwFocusWindow(GLFWwindow* handle)
  (define glfwFocusWindow
    (foreign-procedure "glfwFocusWindow" (GLFWwindow*) void))
  
  ;;  GLFWAPI int glfwGetWindowAttrib(GLFWwindow* handle, int attrib)
  (define glfwGetWindowAttrib
    (foreign-procedure "glfwGetWindowAttrib" (GLFWwindow* int) void))
  
  ;;  GLFWAPI GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* handle)
  (define glfwGetWindowMonitor
    (foreign-procedure "glfwGetWindowMonitor" (GLFWwindow*) void))
  
  ;;  GLFWAPI void glfwSetWindowMonitor(GLFWwindow* wh,
  ;;						GLFWmonitor* mh,
  ;;						int xpos, int ypos,
  ;;						int width, int height,
  ;;						int refreshRate)
  (define glfwSetWindowMonitor
    (foreign-procedure "glfwSetWindowMonitor" (GLFWwindow* GLFWmonitor* int int int int int) void))
  
  ;;  GLFWAPI void glfwSetWindowUserPointer(GLFWwindow* handle, void* pointer)
  (define glfwSetWindowUserPointer
    (foreign-procedure "glfwSetWindowUserPointer" (GLFWwindow* uptr) void))
  
  ;;  GLFWAPI void* glfwGetWindowUserPointer(GLFWwindow* handle)
  (define glfwGetWindowUserPointer
    (foreign-procedure "glfwGetWindowUserPointer" (GLFWwindow*) void))

  ;;  GLFWAPI GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* handle,
  ;;								GLFWwindowposfun cbfun)
  ;;  GLFWAPI GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* handle,
  ;;								  GLFWwindowsizefun cbfun)
  ;;  GLFWAPI GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* handle,
  ;;								    GLFWwindowclosefun cbfun)
  ;;  GLFWAPI GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* handle,
  ;;									GLFWwindowrefreshfun cbfun)
  ;;  GLFWAPI GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* handle,
  ;;								    GLFWwindowfocusfun cbfun)
  ;;  GLFWAPI GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* handle,
  ;;									GLFWwindowiconifyfun cbfun)
  ;;  GLFWAPI GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* handle,
  ;;									    GLFWframebuffersizefun cbfun)

  ;;  GLFWAPI void glfwPollEvents(void)
  (define glfwPollEvents
    (foreign-procedure "glfwPollEvents" () void))
  
  ;;  GLFWAPI void glfwWaitEvents(void)
  (define glfwWaitEvents
    (foreign-procedure "glfwWaitEvents" () void))

  ;;  GLFWAPI void glfwWaitEventsTimeout(double timeout)
  (define glfwWaitEventsTimeout
    (foreign-procedure "glfwWaitEventsTimeout" () void))
  
  ;;  GLFWAPI void glfwPostEmptyEvent(void)
  (define glfwPostEmptyEvent
    (foreign-procedure "glfwPostEmptyEvent" () void))
  )
