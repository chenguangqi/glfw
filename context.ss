(library (glfw context)
  (export
   glfwMakeContextCurrent
   glfwGetCurrentContext
   glfwSwapBuffers
   glfwSwapInterval
   glfwExtensionSupported
   glfwGetProcAddress
   )

  (import
   (chezscheme)
   (glfw utils))

  ;; GLFWAPI void glfwMakeContextCurrent(GLFWwindow* handle)
  (define-foreign-function glfwMakeContextCurrent (uptr) void)

  ;; GLFWAPI GLFWwindow* glfwGetCurrentContext(void)
  (define-foreign-function glfwGetCurrentContext () uptr)
  
  ;; GLFWAPI void glfwSwapBuffers(GLFWwindow* handle)
  (define-foreign-function glfwSwapBuffers (uptr) void)

  ;; GLFWAPI void glfwSwapInterval(int interval)
  (define-foreign-function glfwSwapInterval (int) void)

  ;; GLFWAPI int glfwExtensionSupported(const char* extension)
  (define-foreign-function glfwExtensionSupported (string) boolean)

  ;; GLFWAPI GLFWglproc glfwGetProcAddress(const char* procname)
  (define-foreign-function glfwGetProcAddress (string) uptr)
  
  )
