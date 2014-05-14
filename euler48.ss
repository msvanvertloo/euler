(display
    (let f [(n 1) (sum 0)]
        (if (> n 1000)
            (let* [(str (number->string sum)) (len (string-length str))]
                (substring str (- len 10) len))
            (f (+ n 1) (+ sum (expt n n))))))
(display #\newline)
(exit)
