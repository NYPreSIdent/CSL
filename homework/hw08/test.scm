(define (combine-with f s1 s2)
    (cons-stream (f (car s1) (car s2))
                 (combine-with f (cdr-stream s1) (cdr-stream s2))))

(define (naturals n) (cons-stream n (naturals (+ n 1))))

(define (slice s start end)
    (cond ((= start end) nil)
          ((> start 0) (slice (cdr-stream s) (- start 1) (- end 1)))
          (else (cons (car s) 
                      (slice (cdr-stream s) start (- end 1))))))
  
(define factorials
    (cons-stream 1 (combine-with * (cdr-stream (naturals 0)) factorials)))                

(define (index n s)
    (if (= n 0)
        (car s)
        (index (- n 1) (cdr-stream s))))

(define (exp n)
    (let ((terms (combine-with (lambda (a b) (/ (expt n a) b))
                                (cdr-stream (naturals 0))
                                (cdr-stream factorials))))
                            (cons-stream 1 (combine-with + terms (exp n)))))

(define-macro (make-lambda formal body)
    `(lambda ,formal ,body))

(define-macro (make-stream first second)
        `(list ,first (make-lambda () ,second)))
                                        
(define (cdr-stream-user stream)
        ((car (cdr stream))))

(define a (make-stream (print 1) (make-stream (print 2) nil)))

(define (filter-stream f s)
    (cond ((null? s)
            nil)
          ((f (car s))
            (cons-stream (car s)
                         (filter-stream f (cdr-stream s))))
          (else (filter-stream f (cdr-stream s)))))
        
(define (sieve s)
    (cons-stream (car s)
                 (sieve
                    (filter-stream 
                    (lambda (n) (not (= (remainder n (car s)) 0))) 
                                (cdr-stream s)))))

(define (switch expr cases)
    (cons 'cond 
          (map (lambda (n) (cons `(equal? ,expr (quote ,(car cases))) ,(cdr n)))
                cases)))