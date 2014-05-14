(load "arithmetic-series-sum.ss")

(display (- (+ (arithmetic-series-sum 3 999 3) (arithmetic-series-sum 5 999 5)) (arithmetic-series-sum 15 999 15)))
(display #\newline)
(exit)
