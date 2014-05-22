(load "is-pandigital.ss")
(load "make-number-list.ss")

(display
    (let [(multiples-2 (map (lambda (x) (* 2 x)) (make-number-list 6 (floor (/ 987 2)))))
          (multiples-7 (map (lambda (x) (* 7 x)) (make-number-list 2 (floor (/ 987 7)))))
          (multiples-17 (map (lambda (x) (* 17 x)) (make-number-list 1 (floor (/ 987 17)))))
          (missing-digit (lambda (x)
            (let helper [(lst (map (lambda (x) (- (char->integer x) (char->integer #\0))) (string->list (number->string x)))) (i 0)]
                (if (> i 8)
                    9
                    (if (not (memq i lst))
                        i
                        (helper lst (+ i 1)))))))
          (number-satisfies-rules? (lambda (x)
            (and
                (or
                    (and (< x 1000000000) (is-pandigital? 1 9 x))
                    (and (>= x 1000000000) (is-pandigital? 0 9 x)))
                (= 0 (modulo (modulo (floor (/ x 100000)) 1000) 3))
                (= 0 (modulo (modulo (floor (/ x 10000)) 1000) 5))
                (= 0 (modulo (modulo (floor (/ x 100)) 1000) 11))
                (= 0 (modulo (modulo (floor (/ x 10)) 1000) 13)))))]
        (let loop-2 [(list-2 multiples-2) (sum 0)]
            (if (not (pair? list-2))
                sum
                (let loop-7 [(list-7 multiples-7) (sum sum)]
                    (if (not (pair? list-7))
                        (loop-2 (cdr list-2) sum)
                        (let loop-17 [(list-17 multiples-17) (sum sum)]
                            (if (not (pair? list-17))
                                (loop-7 (cdr list-7) sum)
                                (let* [(combined (+ (* 1000 (+ (* 1000 (car list-2)) (car list-7))) (car list-17))) (combined-with-left-digit (+ combined (* 1000000000 (missing-digit combined))))]
                                    (if (number-satisfies-rules? combined-with-left-digit)
                                        (loop-17 (cdr list-17) (+ sum combined-with-left-digit))
                                        (loop-17 (cdr list-17) sum)))))))))))
(display #\newline)
(exit)
