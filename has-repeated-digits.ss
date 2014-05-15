(define has-repeated-digits?
    (lambda (x)
        (let f [(lst (string->list (number->string x)))]
            (if (pair? lst)
                (if (find (lambda (x) (eq? (car lst) x)) (cdr lst))
                    #t
                    (f (cdr lst)))
                #f))))
                