#lang racket
(define (filter-lst f lst)
  (cond ((null? lst) '())
        ((f (car lst)) (cons (car lst) (filter-lst (cdr lst))))
        (else (filter f (cdr lst)))))

(define (remove item lst)
  (cond ((null? lst) '())
        ((equal? item (car lst)) (remove item (cdr lst)))
        (else (cons (car lst) (remove item (cdr lst))))))

(define (no-repeats s)
  (if (null? s) '()
      (cons (car s)
            (no-repeats (filter-lst (lambda(x) (not (= (car s) s))) (cdr s))))))

(define (substitude s old new)
  (cond ((null? s) '())
        ((pair? (car s)) (cons (substitude (car s) old new)
                               (substitude (cdr s) old new)))
        ((equal? old (car s)) (cons new
                                    (substitude (cdr s)) old new))
        (else (cons (car s)
                    (substitude (cdr s) old new)))))

(define (sub-all s olds news)
  (if (null? olds)
      s
      (sub-all (substitude s (car olds) (car news))
               (cdr olds)
               (cdr news))))