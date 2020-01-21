(define (map fn lst)
    (if (null? lst)
        '()
        (cons (fn (car lst))
              (map fn (cdr lst)))))

(define-macro (for expr var lst)
    `(map (lambda (,var) ,expr) ,lst))

(for (* x 12) x '(3 42 98 72 12 23 43 45 62 1 39 231 23 43))

(define-macro (cond-macro if-suite elif-suit else-suit)
    (list 'if (car if-suite))