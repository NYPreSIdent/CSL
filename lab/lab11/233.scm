(define (replicate x n)
    (if (= n 0)
        nil
        (cons x (replicate x (- n 1)))))
    
(define-macro (repeat-n expr n)
    (cons 'begin (replicate expr n)))

(define (map-stream f s)
    (cons-stream (f (car s))
                 (map-stream f (cdr-stream s))))
             
(define ones (cons-stream 1 ones))

(define (add-stream expr1 expr2)
    (cons-stream (+ (car expr1)
                    (car expr2))
                 (add-stream (cdr-stream epxr1)
                             (cdr-stream expr2))))

(define nat (cons-stream 1 (add-stream ones nat)))

(define (slice s start end)
    (cond ((or (null? s) (= start end)) nil)
          ((>= start 0) (slice (cdr-stream s) (- start 1) (- end 1)))
          (else (cons (car s) (slice (cdr-stream s) (+ start 1) (end))))))