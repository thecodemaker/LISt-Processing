
((lambda (x) (+ x 2)) 4) ; => 6

(mapcar #'(lambda (x) (+ x x)) '(1 2 3 4 5)) ; => (2 4 6 8 10)

