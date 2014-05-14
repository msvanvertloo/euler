(define make-number-list
    (lambda (start end)
        (let f [(s start) (e end) (lst '())]
            (if (>= e s)
                (f s (- e 1) (cons e lst))
                lst))))
