(define (make-fact-stream)
    (define (helper n total)
        (cons-stream total
                     (helper (+ n 1)
                             (* total (+ n 1)))))
    (helper 0 1))

(define (add-three s)
    (if (null? s)
        s
    (cons-stream (+ (car s) 3)
                 (add-three (cdr-stream s)))))
             
(define (unique-stream s)
    (if (null? s)
        nil
        (filter-stream (lambda (x) (not (= (car s) x)))
                       (unique-stream (cdr-stream s)))))
                   
(define (append-stream s1 s2)
    (if (null? s1)
        s2
        (cons-stream (car s1)
                     (append-stream (cdr-stream s1) s2))))

(define (subset-stream lst)
    (if (null? lst)
        (cons-stream nil nil)
        (append-stream (map-stream (lambda (x) (cons-stream (car lst) x))
                                 (subset-stream (cdr lst)))
                       (subset-stream (cdr lst)))))

(define (cycle s)
    (define (with t)
        (if (null? t)
            (cycle s)
            (cons-stream (car t) (with (cdr t)))))
    (with s))

(define (slice s start end)
    (cond ((= start end) 
            nil)
          ((> start 0)
            (slice (cdr-stream s) (- start 1) (- end 1)))
          (else (cons (car s) (slice (cdr-stream s) start (- end 1))))))

(define (p prev curr n)
    (if (= curr n)
        (p curr (+ curr prev) (+ n 1))
        (cons-stream n
                     (p prev curr (+ n 1)))))
               