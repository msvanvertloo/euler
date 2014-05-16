(load "proper-factors.ss")
(load "make-number-list.ss")
(load "remove-elements-from-sorted-list.ss")

(display
    (let f [(n 28123) (abundants '())]
        (if (> n 11)
            (if (> (apply + (proper-factors n)) n)
                (f (- n 1) (cons n abundants))
                (f (- n 1) abundants))
            (let g [(abundants (list-sort < abundants)) (possibilities (make-number-list 1 28123))]
                (if (not (pair? abundants))
                    (apply + possibilities)
                    (g (cdr abundants) (remove-elements-from-sorted-list (map (lambda (x) (+ x (car abundants))) abundants) possibilities)))))))
(display #\newline)
(exit)
