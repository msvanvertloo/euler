(define prime-factorize
    (lambda (x)
        (let f [(val x) (sqrt-val (sqrt x)) (fac 2) (all '()) (single '())]
            (if (< val fac)
                (if (pair? single) (cons single all) all)
                (if (>= sqrt-val fac)
                    (let [(div (/ val fac))]
                        (if (integer? div)
                            (f div (sqrt div) fac all (cons fac single))
                            (f val sqrt-val (+ fac 1) (if (pair? single) (cons single all) all) '())))
                    (if (= val fac)
                        (f 1 1 fac (cons (cons fac single) all) '())
                        (f val val val (if (pair? single) (cons single all) all) '())))))))
