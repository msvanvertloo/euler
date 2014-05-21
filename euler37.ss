(load "generate-primes.ss")

(display
    (let* [(primes (generate-primes 2 999999)) (is-truncatable-prime? (lambda (x)
            (if (memq x primes)
                (let f [(i 0) (str (number->string x))]
                    (if (>= i (- (string-length str) 1))
                        #t
                        (let [(left (string->number (substring str 0 (- (string-length str) i 1)))) (right (string->number (substring str (+ i 1) (string-length str))))]
                            (if (and (memq left primes) (memq right primes))
                                (f (+ i 1) str)
                                #f))))
                #f)))]
        (let f [(lst primes) (sum 0) (cnt 0)]
            (if (not (pair? lst))
                "Not enough primes to search"
                (if (< (car lst) 10)
                    (f (cdr lst) sum cnt)
                    (if (= cnt 11) ; The problem description stated that only 11 of these numbers exist
                        sum
                        (if (is-truncatable-prime? (car lst))
                            (f (cdr lst) (+ sum (car lst)) (+ cnt 1))
                            (f (cdr lst) sum cnt))))))))
(display #\newline)
(exit)
