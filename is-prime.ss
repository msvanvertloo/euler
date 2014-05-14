(define is-prime?
    (lambda (x)
        (if (< x 0)
            #f
            (let [(sqrt-x (sqrt x))]
                (let f [(n 2)]
                    (if (> n sqrt-x)
                        #t
                        (if (= (modulo x n) 0)
                            #f
                            (f (+ n 1)))))))))