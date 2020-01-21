; Macros

(define-macro (list-of map-expr for var in lst if filter-expr)
    `(map (lambda (,var) ,map-expr) (filter (lambda (,var) ,filter-expr) ,lst)))

(define-macro (list-of map-expr for var in lst . args)
    (let ((filtered (if (= (length args) 2)
                        `(filter (lamdba ,(var) (car (cdr args))), lst)
                        lst)))
                    `(map (lambda ,(var) ,map-expr) ,filtered)))

