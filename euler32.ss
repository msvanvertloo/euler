(load "has-repeated-digits.ss")

(display
    (let f [(n 1234) (sqrt-n (sqrt 1234)) (a 2) (sum 0)]
        (if (> n 9876)
            sum
            (if (has-repeated-digits? n)
                (f (+ n 1) (sqrt n) 2 sum)
                (if (>= a sqrt-n)
                    (f (+ n 1) (sqrt n) 2 sum)
                    (let [(b (/ n a))]
                        (if (integer? b)
                            (let [(str (string-append (number->string a) (number->string b) (number->string n)))]
                                (if (= 9 (string-length str))
                                    (if (or (has-repeated-digits? (string->number str)) (find (lambda (x) (eq? x #\0)) (string->list str)))
                                        (f n sqrt-n (+ a 1) sum)
                                        (f (+ n 1) (sqrt n) 2 (+ sum n)))
                                    (f n sqrt-n (+ a 1) sum)))
                            (f n sqrt-n (+ a 1) sum))))))))
(display #\newline)
(exit)

                            