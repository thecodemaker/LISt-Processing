
(defun dot-product (a b)
  "Compute the mathematical dot product of two vectors."
  (if (or (null a) (null b))
    0
    (+ (* (first a) (first b))  (dot-product (rest a) (rest b)))
  )
)

; (dot-product '(1 2 3) '(10 20 30))
;  0: (DOT-PRODUCT (1 2 3) (10 20 30))
;    1: (DOT-PRODUCT (2 3) (20 30))
;      2: (DOT-PRODUCT (3) (30))
;        3: (DOT-PRODUCT NIL NIL)
;        3: DOT-PRODUCT returned 0
;      2: DOT-PRODUCT returned 90
;    1: DOT-PRODUCT returned 130
;  0: DOT-PRODUCT returned 140
; 140

(defun dot-product (a b)
  "Compute the mathematical dot product of two vectors."
  (let ((sum 0 ))
    (dotimes (i (length a))
      (incf sum (* (elt a i) (elt b i))))
    sum
  )
)

; (dot-product '(1 2 3) '(10 20 30))
;  0: (DOT-PRODUCT (1 2 3) (10 20 30))
;  0: DOT-PRODUCT returned 140
; 140

(defun dot-product (a b)
  "Compute the mathematical dot product of two vectors."
  (apply #' + (mapcar #' * a b))
)

; (dot-product '(1 2 3) '(10 20 30))
;  0: (DOT-PRODUCT (1 2 3) (10 20 30))
;  0: DOT-PRODUCT returned 140
; 140
