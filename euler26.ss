(display
    (let f [(n 2) (best-score 0) (best-n 0)]
        (cond
            ((> n 1000) best-n)
            ((or (= (modulo n 2) 0) (= (modulo n 5) 0))
                (f (+ n 1) best-score best-n))
            (else
                (let g [(digit-count 1) (mod 0)]
                    (let [(new-mod (modulo (+ (* mod 10) 9) n))]
                        (if (= new-mod 0)
                            (if (> digit-count best-score)
                                (f (+ n 1) digit-count n)
                                (f (+ n 1) best-score best-n))
                            (g (+ digit-count 1) new-mod))))))))
(display #\newline)
(exit)
