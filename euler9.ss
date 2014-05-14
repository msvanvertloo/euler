(display
    (let f [(a 1) (b 1)]
        (if (= (+ (* a a) (* b b)) (* (- 1000 a b) (- 1000 a b)))
            (* a b (- 1000 a b))
            (if (< b 998)
                (f a (+ 1 b))
                (f (+ 1 a) 1)))))
(display #\newline)
(exit)
