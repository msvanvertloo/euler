(load "make-number-list.ss")
(load "sqr.ss")
        
(let* [(num-list (make-number-list 1 100)) (sum-of-squares (apply + (map sqr num-list))) (square-of-sum (sqr (apply + num-list)))]
    (display (- square-of-sum sum-of-squares))
    (display #\newline))
(exit)
