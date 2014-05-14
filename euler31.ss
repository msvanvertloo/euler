(display
    (letrec [(possible-combinations (lambda (possible-coins desired-sum)
                (if (not (pair? possible-coins))
                    (if (> desired-sum 0)
                        0
                        1)
                    (let f [(this-coin-count 0) (new-sum desired-sum) (possibilities 0)]
                        (if (< new-sum 0)
                            possibilities
                            (f (+ this-coin-count 1) (- new-sum (car possible-coins)) (+ possibilities (possible-combinations (cdr possible-coins) new-sum))))))))]
        (possible-combinations '(200 100 50 20 10 5 2 1) 200)))
(display #\newline)
(exit)
