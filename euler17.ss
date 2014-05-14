(load "number-to-words.ss")

(display
    (let f [(n 1) (sum 0)]
        (if (> n 1000)
            sum
            (f (+ 1 n) (+ sum (string-length (number->words n)))))))
(display #\newline)
(exit)