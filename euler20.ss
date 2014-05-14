(load "factorial.ss")
            
(display (apply + (map (lambda (x) (- (char->integer x) (char->integer #\0))) (string->list (number->string (factorial 100))))))
(display #\newline)
(exit)
