(display
    (let a-loop [(a 2) (best-sum 0)]
        (if (= a 100)
            best-sum
            (let b-loop [(b 2) (best-sum best-sum)]
                (if (= b 100)
                    (a-loop (+ a 1) best-sum)
                    (let [(this-sum (apply + (map (lambda (x) (- (char->integer x) (char->integer #\0))) (string->list (number->string (expt a b))))))]
                        (if (> this-sum best-sum)
                            (b-loop (+ b 1) this-sum)
                            (b-loop (+ b 1) best-sum))))))))
(display #\newline)
(exit)
