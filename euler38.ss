(load "has-repeated-digits.ss")

(display
    (let f [(n 948765321)] ; The first product (i.e. x*1), if not 9, must be less than 95*, since doubling 95* would produce 19* for the second factor
        (if (< n 918273645) ; 918273645 was the example given in the problem.  The largest won't be smaller than that.
            #f
            (if (has-repeated-digits? n)
                (f (- n 1))
                (let [(str (number->string n))]
                    (if (find (lambda (x) (eq? x #\0)) (string->list str))
                        (f (- n 1))
                        (let g [(end-of-first 1)]
                            (if (> end-of-first 4)
                                (f (- n 1))
                                (if (not (eq? (string-ref str end-of-first) #\1))
                                    (g (+ end-of-first 1))
                                    (let [(first-product (string->number (substring str 0 end-of-first)))]
                                        (let h [(mult 2) (test-str (number->string first-product))]
                                            (cond
                                                ((> (string-length test-str) 9) (f (- n 1)))
                                                ((< (string-length test-str) 9) (h (+ mult 1) (string-append test-str (number->string (* first-product mult)))))
                                                (else
                                                    (if (string=? str test-str)
                                                        n
                                                        (f (- n 1))))))))))))))))
(display #\newline)
(exit)
