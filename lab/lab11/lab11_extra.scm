(define-macro (switch expr cases)
    (cond (

(define (flatmap f x)
  (define (helper s so-far)
      (cond ((null? so-far) nil)
            ((list? (car so-far)) (helper (cons ))
            (else (helper (cdr s) (cons (f (car s)) )))

(define (expand lst)
  'YOUR-CODE-HERE)

(define (interpret instr dist)
  'YOUR-CODE-HERE)

(define (apply-many n f x)
  (if (zero? n)
      x
      (apply-many (- n 1) f (f x))))

(define (dragon n d)
  (interpret (apply-many n expand '(f x)) d))