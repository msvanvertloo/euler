(display
    (let [(pentagonal-numbers
            (let f [(n 1) (lst '())]
                (if (> n 3000)
                    (reverse lst)
                    (f (+ n 1) (cons (/ (* (- (* 3 n) 1) n) 2) lst)))))]
        (let f [(pent-1 pentagonal-numbers) (smallest-diff (expt 10 10))]
            (if (not (pair? pent-1))
                smallest-diff
                (let g [(pent-2 (cdr pent-1))]
                    (if (not (pair? pent-2))
                        (f (cdr pent-1) smallest-diff)
                        (let [(sum (+ (car pent-1) (car pent-2))) (diff (- (car pent-2) (car pent-1)))]
                            (cond
                                ((>= diff smallest-diff)
                                    (f (cdr pent-1) smallest-diff))
                                ((not (memq sum pentagonal-numbers))
                                    (g (cdr pent-2)))
                                ((not (memq diff pentagonal-numbers))
                                    (g (cdr pent-2)))
                                (else (f (cdr pent-1) diff))))))))))
(display #\newline)
(exit)
