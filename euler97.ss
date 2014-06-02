(display
    (let calc-1000th [(last-10 1) (iter 0)]
        (if (< iter 1000)
            (calc-1000th (modulo (* 2 last-10) 10000000000) (+ iter 1))
            (let calc-top [(top last-10) (iter 1)]
                (if (< iter 7830)
                    (calc-top (modulo (* top last-10) 10000000000) (+ iter 1))
                    (let calc-total [(total top) (iter 0)]
                        (if (< iter 457)
                            (calc-total (modulo (* total 2) 10000000000) (+ iter 1))
                            (modulo (+ 1 (* 28433 total)) 10000000000))))))))
(display #\newline)
(exit)
