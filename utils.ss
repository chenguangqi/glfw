(library
    (glfw utils)
  (export
   load-glfw
   define-foreign-function)
  (import
   (chezscheme))

  (define load-glfw
    (let ((is-loaded #f))
      (lambda ()
	(if (not is-loaded)
	    (begin
	      (load-shared-object "libglfw.so")
	      (set! is-loaded #t))))))


  (define-syntax define-foreign-function
    (lambda (x)
      (syntax-case x ()
	[(_ name (args ...) ret)
	 #'(define name
	     (begin
	       (load-glfw)
	       (foreign-procedure (symbol->string 'name) (args ...) ret)))])))
  )
