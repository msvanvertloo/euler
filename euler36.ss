(load "is-palindrome-number.ss")

(display
    (let f [(n 1) (sum 0)]
        (if (> n 999999)
            sum
            (if (is-palindrome-number? n)
                (if (is-palindrome-number? (string->number (number->string n 2)))
                    (f (+ n 1) (+ sum n))
                    (f (+ n 1) sum))
                (f (+ n 1) sum)))))
(display #\newline)
(exit)