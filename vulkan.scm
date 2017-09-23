(library
    (glfw vulkan)
  (export

   )
  (import
   (chezscheme)
   (glfw utils))

  ;; GLFWAPI int glfwVulkanSupported(void)
  (define-foreign-function glfwVulkanSupported () int)
  ;; GLFWAPI const char** glfwGetRequiredInstanceExtensions(uint32_t* count)
  (define-foreign-function glfwGetInstanceProcAddress (uptr string) uptr)
  ;; GLFWAPI GLFWvkproc glfwGetInstanceProcAddress(VkInstance instance,
  ;;						   const char* procname)
  (define-foreign-function glfwGetPhysicalDevicePresentationSupport (uptr uptr unsigned-32) int)
  ;; GLFWAPI int glfwGetPhysicalDevicePresentationSupport(VkInstance instance,
  ;;						          VkPhysicalDevice device,
  ;;							  uint32_t queuefamily)
  (define-foreign-function glfwCreateWindowSurface (uptr uptr uptr uptr) uptr)
  ;; GLFWAPI VkResult glfwCreateWindowSurface(VkInstance instance,
  ;;					      GLFWwindow* handle,
  ;;					      const VkAllocationCallbacks* allocator,
  ;;					      VkSurfaceKHR* surface)
  )
