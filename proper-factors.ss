(load "all-factors.ss")

(define proper-factors
    (lambda (x)
        (remp (lambda (y) (= x y)) (all-factors x))))
