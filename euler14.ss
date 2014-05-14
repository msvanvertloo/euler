(load "collatz-chain.ss")

(display
    (let f [(n 999999) (best 0) (best-score 0)]
        (if (>= n 500000)
            (let [(len (length (collatz-chain n)))]
                (if (> len best-score)
                    (f (- n 1) n len)
                    (f (- n 1) best best-score)))
            best)))
(display #\newline)
(exit)
