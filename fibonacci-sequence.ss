(define fibonacci-sequence
    (lambda (stop-value)
        (letrec [(helper
                (lambda (a b)
                    (if (> a stop-value) '() (cons a (helper b (+ a b))))))]
            (helper 1 1))))
