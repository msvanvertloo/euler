(load "is-prime.ss")

(display
    (let f [(a -999) (b -999) (best-score 0) (best-a 0) (best-b 0)]
        (if (> b 999)
            (f (+ a 1) -999 best-score best-a best-b)
            (if (> a 999)
                (* best-a best-b)
                (let prime-check [(n 0)]
                    (let [(quad (+ (* n (+ n a)) b))]
                        (if (is-prime? quad)
                            (prime-check (+ n 1))
                            (if (> n best-score)
                                (f a (+ b 1) n a b)
                                (f a (+ b 1) best-score best-a best-b)))))))))
(display #\newline)
(exit)