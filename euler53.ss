(load "factorial.ss")
(load "make-number-list.ss")

(display
    (let [(factorials (list->vector (map factorial (make-number-list 0 100))))]
        (let n-loop [(n 23) (values-over-million 0)]
            (if (> n 100)
                values-over-million
                (let r-loop [(r 1) (last-r 0) (values-this-round 0)]
                    (cond
                        ((= last-r (/ n 2)) (n-loop (+ n 1) (+ values-over-million (- (* 2 values-this-round) 1))))
                        ((> r (/ n 2)) (n-loop (+ n 1) (+ values-over-million (* 2 values-this-round))))
                        ((> (/ (vector-ref factorials n) (* (vector-ref factorials r) (vector-ref factorials (- n r)))) 1000000)
                            (r-loop (+ r 1) r (+ values-this-round 1)))
                        (else (r-loop (+ r 1) r values-this-round))))))))
(display #\newline)
(exit)
