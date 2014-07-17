
(defun power (x n)
  "Power raises x to the nth power. N must be an integer >= 0.
   This executes in log n time, because of the check for even n."
  (cond 
    (( = n 0) 1)
    ((evenp n) (expt (power x (/ n 2)) 2))
    (t (* x (power x (- n 1))))
  )
)

; (power 2 3)
; 8

; (power 2 3)
; 0: (POWER 2 3)
;   1: (POWER 2 2)
;     2: (POWER 2 1)
;       3: (POWER 2 0)
;       3: POWER returned 1
;     2: POWER returned 2
;   1: POWER returned 4
;  0: POWER returned 8
; 8

; (power 3 4)
; 0: (POWER 3 4)
;   1: (POWER 3 2)
;     2: (POWER 3 1)
;       3: (POWER 3 0)
;       3: POWER returned 1
;     2: POWER returned 3
;   1: POWER returned 9
; 0: POWER returned 81
; 81

; (power 2 0)
;  0: (POWER 2 0)
;  0: POWER returned 1
; 1
 
