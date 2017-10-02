;;; GLFW库的chez-scheme的绑定

;;; http://www.glfw.org/docs/latest/intro_guide.html
;;; 初始化和终止
;;; 大部分GLFW函数在被调用前，GLFW库必须被初始化。
;;; 初始化处理检查主机上那些特性是有效的，枚举监视器和有效控制手柄，
;;; 初始化计时器并执行其他任何必须的平台初始化。

;;; 只有下面的函数可以在GLFW库初始化之前被调用，且仅在主线程中调用。
;;; glfwGetVersion
;;; glfwGetVersionString
;;; glfwSetErrorCallback
;;; glfwInit
;;; glfwTerminate

;;; 在初始化之前，调用其他函数将发生 GLFW_NOT_INITIALIZED 错误。
;;; 使用glfwInit初始化库，如果发生错误将返回 GLFW_FALSE
(library (glfw init)
  (export
   glfwInit
   glfwTerminate
   glfwGetVersion
   glfwGetVersionString
   glfwSetErrorCallback
   )

  (import
   (chezscheme)
   (glfw utils))
 
  (define-foreign-function glfwInit () boolean)
  (define-foreign-function glfwTerminate () void)
  (define-foreign-function glfwGetVersion ((* int) (* int) (* int)) void)
  (define-foreign-function glfwGetVersionString () string)
  (define-foreign-function glfwSetErrorCallback (uptr) uptr)
  
  )
