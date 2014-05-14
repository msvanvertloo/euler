(load "proper-factors.ss")                    

(display
    (let f [(n 9999) (sums-of-factors '())]
        (if (>= n 0)
            (f (- n 1) (cons (apply + (proper-factors n)) sums-of-factors))
            (let g [(n 1) (sum 0)]
                (if (>= n (length sums-of-factors))
                    sum
                    (let [(s (list-ref sums-of-factors n))]
                        (if (and (< s (length sums-of-factors)) (> s n) (= (list-ref sums-of-factors s) n))
                            (g (+ n 1) (+ sum s n))
                            (g (+ n 1) sum))))))))
(display #\newline)
(exit)
