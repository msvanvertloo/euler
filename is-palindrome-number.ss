(define is-palindrome-number?
    (lambda (x)
        (let [(chars (string->list (number->string x)))]
            (let f [(a chars) (b (reverse chars))]
                (if (pair? a)
                    (if (eq? (car a) (car b))
                        (f (cdr a) (cdr b))
                        #f)
                    (not (pair? b)))))))
