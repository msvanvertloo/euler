(define sum-even-values
    (lambda (lst)
        (if (pair? lst)
            (let [(a (car lst)) (b (cdr lst))]
                (if (even? a) (+ a (sum-even-values b)) (sum-even-values b)))
            0)))
