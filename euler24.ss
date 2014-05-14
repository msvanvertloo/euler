(load "factorial.ss")

(display
    (letrec [(rec (lambda (digits remaining-to-skip used)
                (let f [(digit-index 0) (remaining remaining-to-skip) (possibilities (factorial (- (length digits) 1)))]
                    (if (and (= 1 (length digits)) (= 0 remaining))
                        (cons (car digits) used)
                        (if (>= remaining possibilities)
                            (f (+ digit-index 1) (- remaining possibilities) possibilities)
                            (rec (remp (lambda (x) (char=? x (list-ref digits digit-index))) digits) remaining (cons (list-ref digits digit-index) used)))))))]
        (list->string (reverse (rec '(#\0 #\1 #\2 #\3 #\4 #\5 #\6 #\7 #\8 #\9) 999999 '())))))
(display #\newline)
(exit)
