(load "generate-primes.ss")

(display
    (let [(primes (generate-primes 2 999999))]
        (let f [(n 2) (cnt 0)]
            (if (= n 1000000)
                cnt
                (let* [(str-n (number->string n)) (chars-n (string->list str-n))]
                    (if (and (> (length chars-n) 1)
                            (or ; Any number with more than one digit containing one of these digits will, during one of the rotations, have that digit in the ones place -> not prime
                                (memq #\0 chars-n)
                                (memq #\2 chars-n)
                                (memq #\4 chars-n)
                                (memq #\5 chars-n)
                                (memq #\6 chars-n)
                                (memq #\8 chars-n)))
                        (f (+ n 1) cnt)
                        (if (memq n primes)
                            (let g [(str (number->string n)) (i 1)]
                                (if (= i (string-length str))
                                    (f (+ n 1) (+ cnt 1))
                                    (let* [(lst (string->list str)) (new-str (list->string (append (cdr lst) (list (car lst))))) (new-num (string->number new-str))]
                                        (if (memq new-num primes)
                                            (g new-str (+ i 1))
                                            (f (+ n 1) cnt)))))
                            (f (+ n 1) cnt))))))))
(display #\newline)
(exit)
