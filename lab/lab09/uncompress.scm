(define (my-append a b)
    (if (null? a)
        b
        (cons (car a) (my-append (cdr a) b))))
    
(define (replicate x n)
    (if (= n 0)
        '()
        (cons x (replicate x (- n 1)))))
    
(define (uncompress s)
    (if (null? s)
        '()
        (my-append (replicate (car (car s)) (car (cdr (car s)))) 
                   (uncompress(cdr s)))))
    
(uncompress '((a 1) (b 2) (c 5) (d 7)))
