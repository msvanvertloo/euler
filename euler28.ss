(display
    (let f [(square-size 3) (last-value 1) (sum 1)]
        (if (> square-size 1001)
            sum
            (f (+ square-size 2) (+ last-value (* 4 (- square-size 1))) (+ sum (* 4 last-value) (* 10 (- square-size 1)))))))
(display #\newline)
(exit)
