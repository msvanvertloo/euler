(load "is-prime.ss")

(display
    (let f [(num 2) (sum 0)]
        (if (>= num 2000000)
            sum
            (if (is-prime? num)
                (f (+ 1 num) (+ sum num))
                (f (+ 1 num) sum)))))
(display #\newline)
(exit)

            