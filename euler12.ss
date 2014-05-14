(load "number-of-factors.ss")

(display
    (let f [(num 1) (i 2)]
        (let [(n (number-of-factors num))]
        (if (> n 500)
            num
            (f (+ num i) (+ i 1))))))
(display #\newline)
(exit)