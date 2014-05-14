(load "factorial.ss")

(display
    (let [(maximum (* 7 (factorial 9))) (digits `#(,(factorial 0) ,(factorial 1) ,(factorial 2) ,(factorial 3) ,(factorial 4) ,(factorial 5) ,(factorial 6) ,(factorial 7) ,(factorial 8) ,(factorial 9)))]
        (let f [(n 3) (sum 0)]
            (if (> n maximum)
                sum
                (let g [(upper (floor (/ n 10))) (lower (modulo n 10)) (n-sum 0)]
                    (let [(new-sum (+ n-sum (vector-ref digits lower)))]
                        (if (= upper 0)
                            (if (= n new-sum)
                                (f (+ n 1) (+ sum new-sum))
                                (f (+ n 1) sum))
                            (g (floor (/ upper 10)) (modulo upper 10) new-sum))))))))
(display #\newline)
(exit)
