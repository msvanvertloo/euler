(load "sqr.ss")

(display
    (let f [(p 3) (best-p 0) (best-p-score 0)]
        (if (> p 1000)
            best-p
            (let g [(a 1) (b 1) (score 0)]
                (if (> b a)
                    (g (+ a 1) 1 score)
                    (let [(c (- p a b))]
                        (if (< c 0)
                            (if (> score best-p-score)
                                (f (+ p 1) p score)
                                (f (+ p 1) best-p best-p-score))
                            (if (= (+ (sqr a) (sqr b)) (sqr c))
                                (g a (+ b 1) (+ score 1))
                                (g a (+ b 1) score)))))))))
(display #\newline)
(exit)
