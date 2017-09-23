(library
    (glfw monitor)
  (export
   glfwGetMonitors
   glfwGetPrimaryMonitor
   glfwGetMonitorPos
   glfwGetMonitorPhysicalSize
   glfwGetMonitorName
   glfwSetMonitorCallback
   glfwGetVideoModes
   glfwGetVideoMode
   glfwSetGamma
   glfwGetGammaRamp
   glfwSetGammaRamp
   )
  (import
   (chezscheme)
   (glfw utils))

  ;; GLFWAPI GLFWmonitor** glfwGetMonitors(int* count)
  (define-foreign-function glfwGetMonitors ((* int)) uptr)

  ;; GLFWAPI GLFWmonitor* glfwGetPrimaryMonitor(void)
  (define-foreign-function glfwGetPrimaryMonitor () uptr)

  ;; GLFWAPI void glfwGetMonitorPos(GLFWmonitor* handle, int* xpos, int* ypos)
  (define-foreign-function glfwGetMonitorPos (uptr (* int) (* int)) void)

  ;; GLFWAPI void glfwGetMonitorPhysicalSize(GLFWmonitor* handle, int* widthMM, int* heightMM)
  (define-foreign-function glfwGetMonitorPhysicalSize (uptr (* int) (* int)) void)

  ;; GLFWAPI const char* glfwGetMonitorName(GLFWmonitor* handle)
  (define-foreign-function glfwGetMonitorName (uptr) string)

  ;; GLFWAPI GLFWmonitorfun glfwSetMonitorCallback(GLFWmonitorfun cbfun)
  (define-foreign-function glfwSetMonitorCallback (uptr) uptr)

  ;; GLFWAPI const GLFWvidmode* glfwGetVideoModes(GLFWmonitor* handle, int* count)
  (define-foreign-function glfwGetVideoModes (uptr (* int)) uptr)

  ;; GLFWAPI const GLFWvidmode* glfwGetVideoMode(GLFWmonitor* handle)
  (define-foreign-function glfwGetVideoMode (uptr) uptr)

  ;; GLFWAPI void glfwSetGamma(GLFWmonitor* handle, float gamma)
  (define-foreign-function glfwSetGamma (uptr float) void)

  ;; GLFWAPI const GLFWgammaramp* glfwGetGammaRamp(GLFWmonitor* handle)
  (define-foreign-function glfwGetGammaRamp (uptr) uptr)

  ;; GLFWAPI void glfwSetGammaRamp(GLFWmonitor* handle, const GLFWgammaramp* ramp)
  (define-foreign-function glfwSetGammaRamp (uptr uptr) void)

  )
