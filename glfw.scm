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
(library
 (glfw glfw)
 (export
  glfw-init
  glfw-get-version
  glfw-get-version-string
  glfw-terminate
  glfw-set-error-callback)
 (import (chezscheme))
 ;; 加载gflw动态库文件 

 (define-syntax callback
   (syntax-rules ()
     [(_ p (args ...) ret)
      (let ([code (foreign-callable p (args ...) ret)])
	(lock-object code)
	(foreign-callable-entry-point code))]))
 
 
 (define libglfw (load-shared-object "libglfw.so"))
 
 ;; Error Code
 ;;GLFW has not been initialized.
 (define GLFW_NOT_INITIALIZED     #x00010001)
 ;;No context is current for this thread.
 (define GLFW_NO_CURRENT_CONTEXT  #x00010002)
 ;;One of the arguments to the function was an invalid enum value.
 (define GLFW_INVALID_ENUM        #x00010003)
 ;;One of the arguments to the function was an invalid value.
 (define GLFW_INVALID_VALUE       #x00010004)
 ;;A memory allocation failed.
 (define GLFW_OUT_OF_MEMORY       #x00010005)
 ;;GLFW could not find support for the requested API on the system.
 (define GLFW_API_UNAVAILABLE     #x00010006)
 ;;The requested OpenGL or OpenGL ES version is not available.
 (define GLFW_VERSION_UNAVAILABLE #x00010007)
 ;;A platform-specific error occurred that does not match any of the more specific categories.
 (define GLFW_PLATFORM_ERROR      #x00010008)
 ;;The requested format is not supported or available.
 (define GLFW_FORMAT_UNAVAILABLE  #x00010009)
 ;;The specified window does not have an OpenGL or OpenGL ES context.
 (define GLFW_NO_WINDOW_CONTEXT   #x0001000A)

 ;; 错误回调函数类型的定义
 ;; (define-ftype glfw-error-fun (function (int string) void))

 ;; (load-shared-object "/root/glfw-3.2.1/build/src/libglfw.so")

 (define glfw-init
    (foreign-procedure "glfwInit" () boolean))

 (define glfw-terminate
   (foreign-procedure "glfwTerminate" () void))

 (define glfw-get-version
   (lambda ()
     (define get-version (foreign-procedure "glfwGetVersion" ((* int) (* int) (* int)) void))
       (let ([major (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	     [minor (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))]
	     [  rev (make-ftype-pointer int (foreign-alloc (ftype-sizeof int)))])
	 (get-version major minor rev)
	 (values (ftype-ref int () major)
		 (ftype-ref int () minor)
		 (ftype-ref int () rev)))))
 (define glfw-get-version-string
   (foreign-procedure "glfwGetVersionString" () string))

(define (glfw-set-error-callback cb)
  ((foreign-procedure "glfwSetErrorCallback" (uptr) void)
   (callback cb (int string) void)))

;; (define glfw-set-error-callback
;;   (foreign-procedure "glfwSetErrorCallback" ((* glfw-error-fun)) (* glfw-error-fun)))

)


