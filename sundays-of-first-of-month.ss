(load "is-leap-year.ss")

(define sundays-of-first-of-month
    (lambda (year)
        (let* [(base (if (< year 2000) 3 2)) (two-digit-year (modulo year 100)) (leap? (is-leap-year? year)) (doom (modulo (+ base (floor (/ two-digit-year 12)) (modulo two-digit-year 12) (floor (/ (modulo two-digit-year 12) 4))) 7))]
            (+
                (if (and leap? (= doom 3)) 1 0)
                (if (and (not leap?) (= doom 2)) 1 0)
                (if (and leap? (= doom 0)) 1 0)
                (if (and (not leap?) (= doom 6)) 1 0)
                (if (= doom 6) 1 0)
                (if (= doom 3) 1 0)
                (if (= doom 1) 1 0)
                (if (= doom 5) 1 0)
                (if (= doom 3) 1 0)
                (if (= doom 0) 1 0)
                (if (= doom 4) 1 0)
                (if (= doom 2) 1 0)
                (if (= doom 6) 1 0)
                (if (= doom 4) 1 0)))))
