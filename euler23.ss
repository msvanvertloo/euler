(load "proper-factors.ss")
(load "make-number-list.ss")

(display
    (let f [(n 28123) (abundants '())]
        (if (> n 11)
            (if (> (apply + (proper-factors n)) n)
                (f (- n 1) (cons n abundants))
                (f (- n 1) abundants))
            (let g [(abundants (list-sort < abundants)) (possibilities (make-number-list 1 28123))]
                (if (not (pair? abundants))
                    (apply + possibilities)
                    (let h [(one-abundant-sums (map (lambda (x) (+ x (car abundants))) abundants)) (new-possibilities '()) (possibilities possibilities)]
                        ; Since the lists are sorted, removal of the elements can be done in one pass
                        (if (not (pair? one-abundant-sums))
                            (g (cdr abundants) (append (reverse new-possibilities) possibilities))
                            (if (not (pair? possibilities))
                                (g (cdr abundants) (reverse new-possibilities))
                                (let [(one-sum (car one-abundant-sums)) (first-possibility (car possibilities))]
                                    (cond
                                        ((< one-sum first-possibility) (h (cdr one-abundant-sums) new-possibilities possibilities))
                                        ((= one-sum first-possibility) (h (cdr one-abundant-sums) new-possibilities (cdr possibilities)))
                                        (else (h one-abundant-sums (cons (car possibilities) new-possibilities) (cdr possibilities)))))))))))))
(display #\newline)
(exit)
