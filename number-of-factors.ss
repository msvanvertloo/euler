(load "prime-factorize.ss")

(define number-of-factors
    (lambda (x)
        (let [(prime-factors (prime-factorize x))]
            (apply * (map (lambda (x) (+ 1 (length x))) prime-factors)))))
