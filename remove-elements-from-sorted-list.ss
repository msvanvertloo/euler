(define remove-elements-from-sorted-list
    (lambda (elements-to-remove lst)
        (let f [(elements-to-remove elements-to-remove) (lst lst) (new-lst '())]
            (if (not (pair? elements-to-remove))
                (append (reverse new-lst) lst)
                (if (not (pair? lst))
                    (reverse new-lst)
                    (let [(one-to-remove (car elements-to-remove)) (first-item (car lst))]
                        (cond
                            ((< one-to-remove first-item) (f (cdr elements-to-remove) lst new-lst))
                            ((= one-to-remove first-item) (f (cdr elements-to-remove) (cdr lst) new-lst))
                            (else (f elements-to-remove (cdr lst) (cons (car lst) new-lst))))))))))
