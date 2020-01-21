
; Tail recursion

(define (slice s start end)
    (cond ((= start end)
            nil)
          ((> start 0)
            (slice (cdr-stream s) (- start 1) (- end 1)))
          (else (cons (car s)
                      (slice (cdr-stream s) start (- end 1))))))

(define (replicate x n)
  (define (helper so-far length)
      (if (= n length)
          so-far
          (helper (append so-far (list x)) (+ length 1))))
  (helper '() 0))

(define (accumulate-tail combiner start n term)
  (define (helper so-far index)
      (if (= index n)
          so-far
          (helper (combiner so-far
                            (term (+ index 1))) (+ index 1))))
  (helper start 0))

(define (accumulate combiner start n term)
  (if (= n 0)
      start
      (combiner (term n)
                (accumulate combiner start (- n 1) term))))

; Streams

(define (map-stream f s)
    (if (null? s)
    	nil
    	(cons-stream (f (car s)) (map-stream f (cdr-stream s)))))

(define multiples-of-three
  (cons-stream 3
               (map-stream (lambda (n) (+ n 3))
                           multiples-of-three)))


(define (nondecreastream s)
    (cond ((null? s)
        nil)
        ((or (null? (cdr-stream s))
                (> (car s) (car (cdr-stream s))))
            (cons-stream (list (car s))
                         (nondecreastream (cdr-stream s)))
            (else (cons-stream (cons (car s) 
                               (car (nondecreastream (cdr-stream s))))
                         (cdr-stream (nondecreastream (cdr-stream s))))))))
        


(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))