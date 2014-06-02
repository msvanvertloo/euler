(load "sqr.ss")

(display
    (let [(sum-of-digit-squares (lambda (x)
            (apply + (map (lambda (x) (sqr (- (char->integer x) (char->integer #\0)))) (string->list (number->string x))))))]
        ; Since the maximum number to be considered is 9999999, the sum of squares of those digits is the maximum at 81*7=567.  We only need to calculate up to that number ahead of time.
        (let pre-calc [(n 1) (end-with-1 '(1)) (end-with-89 '(89))]
            (if (or (= n 1) (= n 89))
                (pre-calc (+ n 1) end-with-1 end-with-89)
                (if (<= n 567)
                    (let g [(current (sum-of-digit-squares n))]
                        (cond
                            ((memq current end-with-1) (pre-calc (+ n 1) (cons n end-with-1) end-with-89))
                            ((memq current end-with-89) (pre-calc (+ n 1) end-with-1 (cons n end-with-89)))
                            (else (g (sum-of-digit-squares current)))))
                    (let g [(rest n) (cnt-89 (length end-with-89))]
                        (if (= rest 10000000)
                            cnt-89
                            (g (+ rest 1) (if (memq (sum-of-digit-squares rest) end-with-1) cnt-89 (+ cnt-89 1))))))))))
(display #\newline)
(exit)
