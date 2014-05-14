(define cross-list
    (lambda (expression list1 list2)
        (if (or (not (pair? list1)) (not (pair? list2)))
            '()
            (let f [(l1 list1) (result '())]
                (if (not (pair? l1))
                    result
                    (let g [(l2 list2) (result2 '())]
                        (if (pair? l2)
                            (g (cdr l2) (cons (expression (car l1) (car l2)) result2))
                            (if (pair? l1)
                                (f (cdr l1) (append result result2))
                                result))))))))
