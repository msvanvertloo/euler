(load "is-palindrome-number.ss")

(display
    (let [(reverse-number (lambda (x)
            (string->number (list->string (reverse (string->list (number->string x)))))))]
        (let f [(n 5) (cnt 0)]
            (if (= n 10000)
                cnt
                (let sum-loop [(current n) (iter 1)]
                    (let [(sum (+ current (reverse-number current)))]
                        (cond
                            ((> iter 50) (f (+ n 1) (+ cnt 1)))
                            ((is-palindrome-number? sum) (f (+ n 1) cnt))
                            (else (sum-loop sum (+ iter 1))))))))))
(display #\newline)
(exit)
