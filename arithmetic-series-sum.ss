(define arithmetic-series-sum
    (lambda (start end interval)
        (let* [(s start) (cnt (+ 1 (floor (/ (- end start) interval)))) (e (+ start (* (- cnt 1) interval)))]
            (/ (* cnt (+ s e)) 2))))
