(define is-pandigital?
    (lambda (lower upper number)
        (let f [(n lower) (lst (map (lambda (x) (- (char->integer x) (char->integer #\0))) (string->list (number->string number))))]
            (if (> n upper)
                (= (length lst) 0)
                (let-values [((matches non-matches) (partition (lambda (x) (= x n)) lst))]
                    (if (= 1 (length matches))
                        (f (+ n 1) non-matches)
                        #f))))))
                        