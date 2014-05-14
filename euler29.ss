(display
    (let f [(a 2) (b 2) (lst '())]
        (if (> b 100)
            (f (+ a 1) 2 lst)
            (if (> a 100)
                (length lst)
                (let [(pow (expt a b))]
                    (if (not (pair? lst))
                        (f a (+ b 1) (cons pow lst))
                        (if (find (lambda (x) (= x pow)) lst)
                            (f a (+ b 1) lst)
                            (f a (+ b 1) (cons pow lst)))))))))
(display #\newline)
(exit)
