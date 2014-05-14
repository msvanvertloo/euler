(define collatz-chain
    (lambda (start)
        (reverse
            (let f [(n start) (lst '())]
                (if (< n 2)
                    (cons 1 lst)
                    (f (if (even? n) (/ n 2) (+ 1 (* 3 n))) (cons n lst)))))))
