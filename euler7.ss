(load "is-prime.ss")

(display (let f [(num 2) (cnt 0)]
    (if (is-prime? num)
        (if (= cnt 10000)
            num
            (f (+ num 1) (+ cnt 1)))
        (f (+ num 1) cnt))))
(display #\newline)
(exit)
