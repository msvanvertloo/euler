(define number->words
    (lambda (x)
        (cond
            ((= 1000 x) "onethousand")
            ((and (>= x 100) (= (modulo x 100) 0)) (string-append (number->words (floor (/ x 100))) "hundred"))
            ((and (>= x 100) (> (modulo x 100) 0)) (string-append (number->words (floor (/ x 100))) "hundredand" (number->words (modulo x 100))))
            ((>= x 91) (string-append "ninety" (number->words (modulo x 10))))
            ((= x 90) "ninety")
            ((>= x 81) (string-append "eighty" (number->words (modulo x 10))))
            ((= x 80) "eighty")
            ((>= x 71) (string-append "seventy" (number->words (modulo x 10))))
            ((= x 70) "seventy")
            ((>= x 61) (string-append "sixty" (number->words (modulo x 10))))
            ((= x 60) "sixty")
            ((>= x 51) (string-append "fifty" (number->words (modulo x 10))))
            ((= x 50) "fifty")
            ((>= x 41) (string-append "forty" (number->words (modulo x 10))))
            ((= x 40) "forty")
            ((>= x 31) (string-append "thirty" (number->words (modulo x 10))))
            ((= x 30) "thirty")
            ((>= x 21) (string-append "twenty" (number->words (modulo x 10))))
            ((= x 20) "twenty")
            ((= x 19) "nineteen")
            ((= x 18) "eighteen")
            ((= x 17) "seventeen")
            ((= x 16) "sixteen")
            ((= x 15) "fifteen")
            ((= x 14) "fourteen")
            ((= x 13) "thirteen")
            ((= x 12) "twelve")
            ((= x 11) "eleven")
            ((= x 10) "ten")
            ((= x 9) "nine")
            ((= x 8) "eight")
            ((= x 7) "seven")
            ((= x 6) "six")
            ((= x 5) "five")
            ((= x 4) "four")
            ((= x 3) "three")
            ((= x 2) "two")
            ((= x 1) "one"))))
