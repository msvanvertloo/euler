(load "prime-factorize.ss")
(load "cross-list.ss")

(define all-factors
    (lambda (x)
        (letrec [(helper (lambda (lst)
                (if (not (pair? lst))
                    '(1)
                    (let f [(i 0) (n 1) (facs '()) (my-factor (caar lst)) (my-factor-count (length (car lst)))]
                        (if (> i my-factor-count)
                            (cross-list * facs (helper (cdr lst)))
                            (f (+ i 1) (* n my-factor) (cons n facs) my-factor my-factor-count))))))]
            (helper (prime-factorize x)))))
