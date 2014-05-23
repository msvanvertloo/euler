(load "generate-primes.ss")

(display
    (let [(all-primes (generate-primes 2 999999))]
        (let start-loop [(start-primes all-primes) (best-term-count 0) (best-sum 0)]
            (if (not (pair? start-primes))
                best-sum
                (let sum-loop [(end-primes (cdr start-primes)) (current-term-count 1) (sum (car start-primes)) (best-count-with-this-start best-term-count) (best-sum-with-this-start best-sum)]
                    (cond
                        ((or (> sum 999999) (not (pair? end-primes)))
                            (start-loop (cdr start-primes) best-count-with-this-start best-sum-with-this-start))
                        ((< current-term-count best-count-with-this-start)
                            (sum-loop (cdr end-primes) (+ current-term-count 1) (+ sum (car end-primes)) best-count-with-this-start best-sum-with-this-start))
                        ((and (memq sum end-primes) (> current-term-count best-count-with-this-start))
                            (sum-loop (cdr end-primes) (+ current-term-count 1) (+ sum (car end-primes)) current-term-count sum))
                        (else (sum-loop (cdr end-primes) (+ current-term-count 1) (+ sum (car end-primes)) best-count-with-this-start best-sum-with-this-start))))))))
(display #\newline)
(exit)
