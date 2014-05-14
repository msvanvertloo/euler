(display
    (let f [(r 19) (c 19) (value-to-right 1) (row-below '(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1)) (current-row '(1))]
        (if (< c 0)
            (if (< r 0)
                (car row-below)
                (f (- r 1) 19 1 current-row '(1)))
            (let [(current-value (+ value-to-right (list-ref row-below c)))]
                (f r (- c 1) current-value row-below (cons current-value current-row))))))
(display #\newline)
(exit)
