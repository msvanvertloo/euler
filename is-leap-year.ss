(define is-leap-year?
    (lambda (year)
        (and (= (modulo year 4) 0) (or (> (modulo year 100) 0) (= (modulo year 400) 0)))))
        