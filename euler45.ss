; T[n] = T[n-1] + n
; P[n] = P[n-1] + 3n-2
; H[n] = H[n-1] + 4n-3

(display
    (let f [(t 286) (last-triangle 40755) (p 166) (last-pentagonal 40755) (h 144) (last-hexagonal 40755)]
        (let [(new-triangle (+ last-triangle t))]
            (cond
                ((< new-triangle last-pentagonal) (f (+ t 1) new-triangle p last-pentagonal h last-hexagonal))
                ((> new-triangle last-pentagonal) (f t last-triangle (+ p 1) (+ last-pentagonal (- (* 3 p) 2)) h last-hexagonal))
                ((< new-triangle last-hexagonal) (f (+ t 1) new-triangle p last-pentagonal h last-hexagonal))
                ((> new-triangle last-hexagonal) (f t last-triangle p last-pentagonal (+ h 1) (+ last-hexagonal (- (* 4 h) 3))))
                (else new-triangle)))))
(display #\newline)
(exit)
