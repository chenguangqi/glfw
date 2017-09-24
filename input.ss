(library
    (glfw input)
  (export
   glfwGetInputMode
   glfwSetInputMode
   glfwGetKeyName
   glfwGetKey
   glfwGetMouseButton
   glfwGetCursorPos
   glfwSetCursorPos
   glfwCreateCursor
   glfwCreateStandardCursor
   glfwDestroyCursor
   glfwSetCursor
   glfwSetKeyCallback
   glfwSetCharCallback
   glfwSetCharModsCallback
   glfwSetMouseButtonCallback
   glfwSetCursorPosCallback
   glfwSetCursorEnterCallback
   glfwSetScrollCallback
   glfwSetDropCallback
   glfwJoystickPresent
   glfwGetJoystickAxes
   glfwGetJoystickButtons
   glfwGetJoystickName
   glfwSetJoystickCallback
   glfwSetClipboardString
   glfwGetClipboardString
   glfwGetTime
   glfwSetTime
   glfwGetTimerValue
   glfwGetTimerFrequency
   )
  (import
   (chezscheme)
   (glfw utils))

  ;; GLFWAPI int glfwGetInputMode(GLFWwindow* handle, int mode)
  (define-foreign-function glfwGetInputMode (uptr int) int)
  ;; GLFWAPI void glfwSetInputMode(GLFWwindow* handle, int mode, int value)
  (define-foreign-function glfwSetInputMode (uptr int int) void)
  ;; GLFWAPI const char* glfwGetKeyName(int key, int)
  (define-foreign-function glfwGetKeyName (int int) string)
  ;; GLFWAPI int glfwGetKey(GLFWwindow* handle, int key)
  (define-foreign-function glfwGetKey (uptr int) int)
  ;; GLFWAPI int glfwGetMouseButton(GLFWwindow* handle, int button)
  (define-foreign-function glfwGetMouseButton (uptr int) int)
  ;; GLFWAPI void glfwGetCursorPos(GLFWwindow* handle, double* xpos, double* ypos)
  (define-foreign-function glfwGetCursorPos (uptr (* double) (* double)) void)
  ;; GLFWAPI void glfwSetCursorPos(GLFWwindow* handle, double xpos, double ypos)
  (define-foreign-function glfwSetCursorPos (uptr double double) void)
  ;; GLFWAPI GLFWcursor* glfwCreateCursor(const GLFWimage* image, int xhot, int yhot)
  (define-foreign-function glfwCreateCursor (uptr int int) uptr)
  ;; GLFWAPI GLFWcursor* glfwCreateStandardCursor(int shape)
  (define-foreign-function glfwCreateStandardCursor (int) uptr)
  ;; GLFWAPI void glfwDestroyCursor(GLFWcursor* handle)
  (define-foreign-function glfwDestroyCursor (uptr) void)
  ;; GLFWAPI void glfwSetCursor(GLFWwindow* windowHandle, GLFWcursor* cursorHandle)
  (define-foreign-function glfwSetCursor (uptr uptr) void)
  ;; GLFWAPI GLFWkeyfun glfwSetKeyCallback(GLFWwindow* handle, GLFWkeyfun cbfun)
  (define-foreign-function glfwSetKeyCallback (uptr uptr) uptr)
  ;; GLFWAPI GLFWcharfun glfwSetCharCallback(GLFWwindow* handle, GLFWcharfun cbfun)
  (define-foreign-function glfwSetCharCallback (uptr uptr) uptr)
  ;; GLFWAPI GLFWcharmodsfun glfwSetCharModsCallback(GLFWwindow* handle, GLFWcharmodsfun cbfun)
  (define-foreign-function glfwSetCharModsCallback (uptr uptr) uptr)
  ;; GLFWAPI GLFWmousebuttonfun glfwSetMouseButtonCallback(GLFWwindow* handle, GLFWmousebuttonfun cbfun)
  (define-foreign-function glfwSetMouseButtonCallback (uptr uptr) uptr)
  ;; GLFWAPI GLFWcursorposfun glfwSetCursorPosCallback(GLFWwindow* handle, GLFWcursorposfun cbfun)
  (define-foreign-function glfwSetCursorPosCallback (uptr uptr) uptr)
  ;; GLFWAPI GLFWcursorenterfun glfwSetCursorEnterCallback(GLFWwindow* handle, GLFWcursorenterfun cbfun)
  (define-foreign-function glfwSetCursorEnterCallback (uptr uptr) uptr)
  ;; GLFWAPI GLFWscrollfun glfwSetScrollCallback(GLFWwindow* handle, GLFWscrollfun cbfun)
  (define-foreign-function glfwSetScrollCallback (uptr uptr) uptr)
  ;; GLFWAPI GLFWdropfun glfwSetDropCallback(GLFWwindow* handle, GLFWdropfun cbfun)
  (define-foreign-function glfwSetDropCallback (uptr uptr) uptr)
  ;; GLFWAPI int glfwJoystickPresent(int joy)
  (define-foreign-function glfwJoystickPresent (int) int)
  ;; GLFWAPI const float* glfwGetJoystickAxes(int joy, int* count)
  (define-foreign-function glfwGetJoystickAxes (int (* int)) (* float))
  ;; GLFWAPI const unsigned char* glfwGetJoystickButtons(int joy, int* count)
  (define-foreign-function glfwGetJoystickButtons (int (* int)) string)
  ;; GLFWAPI const char* glfwGetJoystickName(int joy)
  (define-foreign-function glfwGetJoystickName (int) string)
  ;; GLFWAPI GLFWjoystickfun glfwSetJoystickCallback(GLFWjoystickfun cbfun)
  (define-foreign-function glfwSetJoystickCallback (uptr) uptr)
  ;; GLFWAPI void glfwSetClipboardString(GLFWwindow* handle, const char* string)
  (define-foreign-function glfwSetClipboardString (uptr string) void)
  ;; GLFWAPI const char* glfwGetClipboardString(GLFWwindow* handle)
  (define-foreign-function glfwGetClipboardString (uptr) string)
  ;; GLFWAPI double glfwGetTime(void)
  (define-foreign-function glfwGetTime () double)
  ;; GLFWAPI void glfwSetTime(double time)
  (define-foreign-function glfwSetTime (double) void)
  ;; GLFWAPI uint64_t glfwGetTimerValue(void)
  (define-foreign-function glfwGetTimerValue () unsigned-64)
  ;; GLFWAPI uint64_t glfwGetTimerFrequency(void)
  (define-foreign-function glfwGetTimerFrequency () unsigned-64)
  )
