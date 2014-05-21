(load "is-prime.ss")
(load "is-pandigital.ss")

(display
    (let f [(i 7654321)]  ; All pandigital numbers with 1-8 and 1-9 are divisible by 3, so don't check them (they won't be prime)
        (if (not (is-pandigital? 1 (string-length (number->string i)) i))
            (f (- i 2))
            (if (is-prime? i)
                i
                (f (- i 2))))))
(display #\newline)
(exit)