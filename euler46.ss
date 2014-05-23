(load "generate-primes.ss")
(load "sqr.ss")
(load "make-number-list.ss")

(display
    (let [(primes (generate-primes 2 9999)) (squares (map (lambda (x) (* 2 (sqr x))) (make-number-list 1 1000)))]
        (let n-loop [(primes primes) (smaller-primes '()) (n 9)]
            (if (<= (car primes) n)
                (n-loop (cdr primes) (cons (car primes) smaller-primes) (if (= (car primes) n) (+ n 2) n))
                (let prime-loop [(primes-left smaller-primes)]
                    (let square-loop [(squares-left squares)]
                        (cond
                            ((not (pair? primes-left)) n)
                            ((not (pair? squares-left)) (prime-loop (cdr smaller-primes)))
                            ((>= (car primes-left) n) (prime-loop (cdr primes-left)))
                            ((< (+ (car primes-left) (car squares-left)) n) (square-loop (cdr squares-left)))
                            ((> (+ (car primes-left) (car squares-left)) n) (prime-loop (cdr primes-left)))
                            (else (n-loop primes smaller-primes (+ n 2))))))))))
(display #\newline)
(exit)
