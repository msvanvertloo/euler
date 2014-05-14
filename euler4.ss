(load "is-palindrome-number.ss")

(display (let f [(a 999) (b 999) (best-a 0) (best-b 0) (best-score 0)]
    (if (and (> a 99) (> b 99))
        (let [(score (* a b))]
            (if (> score best-score)
                (if (is-palindrome-number? score)
                    (f a (- b 1) a b score)
                    (f a (- b 1) best-a best-b best-score))
                (f a (- b 1) best-a best-b best-score)))
        (if (> a 100)
            (f (- a 1) 999 best-a best-b best-score)
            best-score))))
(display #\newline)
(exit)
