(load "fibonacci-sequence.ss")
(load "sum-even-values.ss")
            
(display (sum-even-values (fibonacci-sequence 4000000)))
(display #\newline)
(exit)