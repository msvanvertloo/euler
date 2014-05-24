(define list-eq?
    (lambda (x y)
        (cond
            ((not (pair? x)) (not (pair? y)))
            ((not (pair? y)) #f)
            ((eq? (car x) (car y)) (list-eq? (cdr x) (cdr y)))
            (else #f))))