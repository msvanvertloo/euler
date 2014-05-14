(display
    (let [(powers `#(,(expt 0 5) ,(expt 1 5) ,(expt 2 5) ,(expt 3 5) ,(expt 4 5) ,(expt 5 5) ,(expt 6 5) ,(expt 7 5) ,(expt 8 5) ,(expt 9 5)))]
        (let f [(n 2) (sum-of-possibles 0)]
            (if (> n (* 6 (vector-ref powers 9)))
                sum-of-possibles
                (if (= n (apply + (map (lambda (x) (vector-ref powers (- (char->integer x) (char->integer #\0)))) (string->list (number->string n)))))
                    (f (+ n 1) (+ sum-of-possibles n))
                    (f (+ n 1) sum-of-possibles))))))
(display #\newline)
(exit)