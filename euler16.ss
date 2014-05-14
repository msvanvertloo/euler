(display (apply + (map (lambda (x) (- (char->integer x) (char->integer #\0))) (string->list (number->string (expt 2 1000))))))
(display #\newline)
(exit)
