(display
    (let f [(last-iter 1) (val (/ 3 2)) (cnt 0)]
        (if (= last-iter 1000)
            cnt
            (if (> (string-length (number->string (numerator val))) (string-length (number->string (denominator val))))
                (f (+ last-iter 1) (+ 1 (/ 1 (+ 1 val))) (+ cnt 1))
                (f (+ last-iter 1) (+ 1 (/ 1 (+ 1 val))) cnt)))))
(display #\newline)
(exit)
