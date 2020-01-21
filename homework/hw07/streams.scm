(define ones (cons-stream 1 ones))

(define (square-stream s)
    (cons-stream (* (car s) (car s))
                 (square-stream (cdr-stream s))))

(define (add-streams s t)
    (cons-stream (+ (car s) (car t))
                 (add-streams (cdr-stream s)
                              (cdr-stream t))))
                          
(define ints (cons-stream 1 (add-streams ones ints)))

(define (sieve s)
    (cons-stream (car s)
                 (sieve
                    (filter-stream
                        (lambda (x) (not (= 0 (remainder x (car s)))))
                        (cdr-stream s)))))