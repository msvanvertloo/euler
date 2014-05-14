(load "prime-factorize.ss")

(display
    (let f [(n 2) (primes1 (prime-factorize 2)) (primes2 (prime-factorize 3)) (primes3 (prime-factorize 4)) (primes4 (prime-factorize 5))]
        (cond
            ((not (= (length primes4) 4))
                (f (+ n 4) (prime-factorize (+ n 4)) (prime-factorize (+ n 5)) (prime-factorize (+ n 6)) (prime-factorize (+ n 7))))
            ((not (= (length primes3) 4))
                (f (+ n 3) primes4 (prime-factorize (+ n 4)) (prime-factorize (+ n 5)) (prime-factorize (+ n 6))))
            ((not (= (length primes2) 4))
                (f (+ n 2) primes3 primes4 (prime-factorize (+ n 4)) (prime-factorize (+ n 5))))
            ((not (= (length primes1) 4))
                (f (+ n 1) primes2 primes3 primes4 (prime-factorize (+ n 4))))
            (else n))))
(display #\newline)
(exit)