(define ones (cons-stream 1 ones))

(define (square-stream s)
    (cons-stream (* (car s) (car s))
                 (square-stream (cdr-stream s))))

(define (add-streams s t)
    (cons-stream (+ (car s) (car t))
                 (add-streams (cdr-stream s)
                              (cdr-stream t))))
                          
(define ints (cons-stream 0 (add-streams ones ints)))

(define (slice s start end)
    (cond ((or (null? s) (= start end)) 
                 nil)
          ((> start 0) 
                (slice (cdr-stream s) (- start 1) (- end 1)))
          (else 
                (cons (car s) 
                      (slice (cdr-stream s) start (- end 1))))))