(define (combine-with f xs ys)
    (cons-stream (f (car xs) (car ys))
                 (combine-with f (cdr-stream xs) (cdr-stream ys))))
             
(define (naturals n) (cons-stream n (naturals (+ n 1))))

(define (slice s begin end)
    (cond ((or (null? s) (= begin end))
              nil)
          ((> begin 0) (slice (cdr-stream s) (- begin 1) (- end 1)))
          (else (cons (car s) (slice (cdr-stream s) begin (- end 1))))))
      
(define evens (combine-with + (naturals 0) (naturals 0)))

(define fib
    (cons-stream 0 
                 (cons-stream 1
                              (combine-with + fib (cdr-stream fib)))))
                          
(define factorials
    (cons-stream 1 (combine-with * (naturals 1) factorials)))

(define (cycle n) (cons-stream n (cycle n)))

(define all-twos (cycle 2))

(define (combine-pairs f s)
    (cons-stream (f (car s) (cdr (cdr-stream s))) 
                 (combine-pairs f (cdr-stream (cdr-stream s)))))
             
(define (exp x)
        (combine-with / 
                      (combine-with expt 
                                    (cycle x) (naturals 0)) 
                      factorials))
                  


