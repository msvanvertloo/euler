(load "list-eq.ss")

(display
    (let f [(n 1) (2n 2) (3n 3) (4n 4) (5n 5) (6n 6)]
        (let [(number-has-digits? (lambda (x lst)
                (list-eq? (sort char<? (string->list (number->string x))) lst)))
              (digit-list (sort char<? (string->list (number->string n))))]
            (cond
                ((and (number-has-digits? 2n digit-list)
                      (number-has-digits? 3n digit-list)
                      (number-has-digits? 4n digit-list)
                      (number-has-digits? 5n digit-list)
                      (number-has-digits? 6n digit-list)) n)
                (else (f (+ n 1) (+ 2n 2) (+ 3n 3) (+ 4n 4) (+ 5n 5) (+ 6n 6)))))))
(display #\newline)
(exit)
