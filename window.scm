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
   glfwGetFramebufferSize
   glfwGetWindowFrameSize
   glfwIconifyWindow
   glfwRestoreWindow
   glfwMaximizeWindow
   glfwShowWindow
   glfwHideWindow
   glfwFocusWindow
   glfwGetWindowAttrib
   glfwGetWindowMonitor
   glfwSetWindowMonitor
   glfwSetWindowUserPointer
   glfwGetWindowUserPointer
   glfwSetWindowPosCallback
   glfwSetWindowSizeCallback
   glfwSetWindowCloseCallback
   glfwSetWindowRefreshCallback
   glfwSetWindowFocusCallback
   glfwSetWindowIconifyCallback
   glfwSetFramebufferSizeCallback
   glfwPollEvents
   glfwWaitEvents
   glfwWaitEventsTimeout
   glfwPostEmptyEvent
   )
  (import
   (chezscheme)
   (glfw utils))
  ;; GLFWAPI GLFWwindow* glfwCreateWindow(int width, int height,
  ;;					   const char* title,
  ;;					   GLFWmonitor* monitor,
  ;;					   GLFWwindow* share)
  (define-foreign-function glfwCreateWindow (int int string uptr uptr) uptr)
  
  ;; GLFWAPI void glfwWindowHint(int hint, int value)
  (define-foreign-function glfwWindowHint (int int) void)
  
  ;; GLFWAPI void glfwDestroyWindow(GLFWwindow* handle)
  (define-foreign-function glfwDestroyWindow (uptr) void)
  
  ;; GLFWAPI int glfwWindowShouldClose(GLFWwindow* handle)
  (define-foreign-function glfwWindowShouldClose (uptr) int)
  
  ;; GLFWAPI void glfwSetWindowShouldClose(GLFWwindow* handle, int value)
  (define-foreign-function glfwSetWindowShouldClose (uptr int) void)
  
  ;; GLFWAPI void glfwSetWindowTitle(GLFWwindow* handle, const char* title)
  (define-foreign-function glfwSetWindowTitle (uptr string) void)
  
  ;; GLFWAPI void glfwSetWindowIcon(GLFWwindow* handle,
  ;;					     int count, const GLFWimage* images)
  (define-foreign-function glfwSetWindowIcon (uptr int uptr) void)
  
  ;; GLFWAPI void glfwGetWindowPos(GLFWwindow* handle, int* xpos, int* ypos)
  (define-foreign-function glfwGetWindowPos (uptr (* int) (* int)) void)

  
  ;;  GLFWAPI void glfwSetWindowPos(GLFWwindow* handle, int xpos, int ypos)
  (define-foreign-function glfwSetWindowPos (uptr int int) void)
  
  ;;  GLFWAPI void glfwGetWindowSize(GLFWwindow* handle, int* width, int* height)
  (define-foreign-function glfwGetWindowSize (uptr (* int) (* int)) void)


  ;;  GLFWAPI void glfwSetWindowSize(GLFWwindow* handle, int width, int height)
  (define-foreign-function glfwSetWindowSize (uptr int int) void)

  ;;  GLFWAPI void glfwSetWindowSizeLimits(GLFWwindow* handle,
  ;;						   int minwidth, int minheight,
  ;;						   int maxwidth, int maxheight)
  (define-foreign-function glfwSetWindowSizeLimits (uptr int int int int) void)

  ;;  GLFWAPI void glfwSetWindowAspectRatio(GLFWwindow* handle, int numer, int denom)
  (define-foreign-function glfwSetWindowAspectRatio (uptr int int) void)

  ;;  GLFWAPI void glfwGetFramebufferSize(GLFWwindow* handle, int* width, int* height)
  (define-foreign-function glfwGetFramebufferSize (uptr (* int) (* int)) void)

  ;;  GLFWAPI void glfwGetWindowFrameSize(GLFWwindow* handle,
  ;;						  int* left, int* top,
  ;;						  int* right, int* bottom)
  (define-foreign-function glfwGetWindowFrameSize (uptr (* int) (* int) (* int) (* int)) void)

  ;;  GLFWAPI void glfwIconifyWindow(GLFWwindow* handle)
  (define-foreign-function glfwIconifyWindow (uptr) void)

  ;;  GLFWAPI void glfwRestoreWindow(GLFWwindow* handle)
  (define-foreign-function glfwRestoreWindow (uptr) void)

  ;;  GLFWAPI void glfwMaximizeWindow(GLFWwindow* handle)
  (define-foreign-function glfwMaximizeWindow (uptr) void)

  ;;  GLFWAPI void glfwShowWindow(GLFWwindow* handle)
  (define-foreign-function glfwShowWindow (uptr) void)

  ;;  GLFWAPI void glfwHideWindow(GLFWwindow* handle)
  (define-foreign-function glfwHideWindow (uptr) void)

  ;;  GLFWAPI void glfwFocusWindow(GLFWwindow* handle)
  (define-foreign-function glfwFocusWindow (uptr) void)

  ;;  GLFWAPI int glfwGetWindowAttrib(GLFWwindow* handle, int attrib)
  (define-foreign-function glfwGetWindowAttrib (uptr int) void)

  ;;  GLFWAPI GLFWmonitor* glfwGetWindowMonitor(GLFWwindow* handle)
  (define-foreign-function glfwGetWindowMonitor (uptr) void)

  ;;  GLFWAPI void glfwSetWindowMonitor(GLFWwindow* wh,
  ;;						GLFWmonitor* mh,
  ;;						int xpos, int ypos,
  ;;						int width, int height,
  ;;						int refreshRate)
  (define-foreign-function glfwSetWindowMonitor (uptr uptr int int int int int) void)

  ;;  GLFWAPI void glfwSetWindowUserPointer(GLFWwindow* handle, void* pointer)
  (define-foreign-function glfwSetWindowUserPointer (uptr uptr) void)

  ;;  GLFWAPI void* glfwGetWindowUserPointer(GLFWwindow* handle)
  (define-foreign-function glfwGetWindowUserPointer (uptr) void)

  ;;  GLFWAPI GLFWwindowposfun glfwSetWindowPosCallback(GLFWwindow* handle,
  (define-foreign-function glfwSetWindowPosCallback (uptr uptr) uptr)

  ;;  GLFWAPI GLFWwindowsizefun glfwSetWindowSizeCallback(GLFWwindow* handle,
  (define-foreign-function glfwSetWindowSizeCallback (uptr uptr) uptr)
  
  ;;								  GLFWwindowsizefun cbfun)
  ;;  GLFWAPI GLFWwindowclosefun glfwSetWindowCloseCallback(GLFWwindow* handle,
  ;;								    GLFWwindowclosefun cbfun)
  (define-foreign-function glfwSetWindowCloseCallback (uptr uptr) uptr)

  ;;  GLFWAPI GLFWwindowrefreshfun glfwSetWindowRefreshCallback(GLFWwindow* handle,
  ;;									GLFWwindowrefreshfun cbfun)
  (define-foreign-function glfwSetWindowRefreshCallback (uptr uptr) uptr)

  ;;  GLFWAPI GLFWwindowfocusfun glfwSetWindowFocusCallback(GLFWwindow* handle,
  ;;								    GLFWwindowfocusfun cbfun)
  (define-foreign-function glfwSetWindowFocusCallback (uptr uptr) uptr)
  
  ;;  GLFWAPI GLFWwindowiconifyfun glfwSetWindowIconifyCallback(GLFWwindow* handle,
  ;;									GLFWwindowiconifyfun cbfun)
  (define-foreign-function glfwSetWindowIconifyCallback (uptr uptr) uptr)
  
  ;;  GLFWAPI GLFWframebuffersizefun glfwSetFramebufferSizeCallback(GLFWwindow* handle,
  ;;									    GLFWframebuffersizefun cbfun)
  (define-foreign-function glfwSetFramebufferSizeCallback (uptr uptr) uptr)

  ;;  GLFWAPI void glfwPollEvents(void)
  (define-foreign-function glfwPollEvents () void)

  ;;  GLFWAPI void glfwWaitEvents(void)
  (define-foreign-function glfwWaitEvents () void)

  ;;  GLFWAPI void glfwWaitEventsTimeout(double timeout)
  (define-foreign-function glfwWaitEventsTimeout () void)

  ;;  GLFWAPI void glfwPostEmptyEvent(void)
  (define-foreign-function glfwPostEmptyEvent () void)
  )


