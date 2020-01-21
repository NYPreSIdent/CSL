(define (partial-sums stream)
  (define (helper so-far rest)
      (if (null? rest)
          nil
          (begin (define result (+ so-far (car rest)))
          (cons-stream result
                       (helper result (cdr-stream rest))))))
  (helper 0 stream))