(library
    (glfw utils)
  (export
   define-foreign-function)
  (import
   (chezscheme))
  
  (define-syntax define-foreign-function
    (lambda (x)
      (syntax-case x ()
	[(_ name (args ...) ret)
	 #'(define name
	     (foreign-procedure (symbol->string 'name) (args ...) ret))])))
  )
