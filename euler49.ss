(load "generate-primes.ss")

(display
    (letrec [(list-eq? (lambda (x y)
                (cond
                    ((not (pair? x)) (not (pair? y)))
                    ((not (pair? y)) #f)
                    ((eq? (car x) (car y)) (list-eq? (cdr x) (cdr y)))
                    (else #f))))]
        (let [(numbers-have-same-digits? (lambda x
                (cond
                    ((not (pair? x)) #t)
                    ((= 1 (length x)) #t)
                    (else
                        (let helper [(digits (sort char<? (string->list (number->string (car x))))) (rest-of-list (cdr x))]
                            (cond
                                ((not (pair? rest-of-list)) #t)
                                ((list-eq? digits (sort char<? (string->list (number->string (car rest-of-list))))) (helper digits (cdr rest-of-list)))
                                (else #f)))))))]
            (let f [(primes (generate-primes 1000 9999))]
                (let g [(current-prime (car primes)) (primes-left (cdr primes))]
                    (if (not (pair? primes-left))
                        (f (cdr primes))
                        (let [(prime-triple (list current-prime (car primes-left) (+ (car primes-left) (- (car primes-left) current-prime))))]
                            (if (and (memq (caddr prime-triple) primes-left) (apply numbers-have-same-digits? prime-triple) (not (= current-prime 1487)))
                                (apply string-append (map number->string prime-triple))
                                (g current-prime (cdr primes-left))))))))))
(display #\newline)
(exit)
