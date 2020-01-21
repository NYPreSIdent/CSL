(define ones (cons-stream 1 ones))

(define (add-two stream1 stream2)
    (cons-stream (+ (car stream1)
                    (car stream2))
                 (add-two (cdr-stream stream1)
                          (cdr-stream stream2))))

(define nat (cons-stream 1 (add-two ones nat)))

(define (c))