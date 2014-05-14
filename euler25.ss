(display
    (let [(limit (expt 10 999))]
        (let f [(fib-1 1) (fib-2 1) (index 1)]
            (if (>= fib-1 limit)
                index
                (f fib-2 (+ fib-1 fib-2) (+ index 1))))))
(display #\newline)
(exit)
