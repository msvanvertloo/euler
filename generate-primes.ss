(load "make-number-list.ss")

(define generate-primes
    (lambda (minimum maximum)
        (let [(sqrt-max (sqrt maximum))]
            (let f [(n 2) (possibilities (make-number-list minimum maximum)) (new-possibilities '())]
                (if (> n sqrt-max)
                    possibilities
                    (if (not (pair? possibilities))
                        (if (not (pair? new-possibilities))
                            '()
                            (f (+ n 1) (reverse new-possibilities) '()))
                        (if (and (> (car possibilities) n) (= (modulo (car possibilities) n) 0))
                            (f n (cdr possibilities) new-possibilities)
                            (f n (cdr possibilities) (cons (car possibilities) new-possibilities)))))))))