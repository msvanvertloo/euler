(load "sundays-of-first-of-month.ss")

(display
    (let f [(year 1901) (cnt 0)]
        (if (= year 2001)
            cnt
            (f (+ year 1) (+ cnt (sundays-of-first-of-month year))))))
(display #\newline)
(exit)