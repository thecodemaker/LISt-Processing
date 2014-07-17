
(defun count-atoms (exp)
  "Return the total number of non-nil atoms in the expression."
  (cond 
    ((null exp) 0)
    ((atom exp) 1)
    (t (+ (count-atoms (first exp)) (count-atoms (rest exp))))
  )
)

(defun count-all-atoms (exp &optional (if-null 1))
  "Return the total number of atoms in the expression.
   counting nil as an atom only in non-tail position."
  (cond 
    ((null exp) if-null)
    ((atom exp) 1)
    (t (+ (count-all-atoms (first exp) 1) (count-all-atoms (rest exp) 0)))
  )
)

; (count-atoms '(a (b) c))
;  0: (COUNT-ATOMS (A (B) C))
;    1: (COUNT-ATOMS A)
;    1: COUNT-ATOMS returned 1
;    1: (COUNT-ATOMS ((B) C))
;      2: (COUNT-ATOMS (B))
;        3: (COUNT-ATOMS B)
;        3: COUNT-ATOMS returned 1
;        3: (COUNT-ATOMS NIL)
;        3: COUNT-ATOMS returned 0
;      2: COUNT-ATOMS returned 1
;      2: (COUNT-ATOMS (C))
;        3: (COUNT-ATOMS C)
;        3: COUNT-ATOMS returned 1
;        3: (COUNT-ATOMS NIL)
;        3: COUNT-ATOMS returned 0
;      2: COUNT-ATOMS returned 1
;    1: COUNT-ATOMS returned 2
;  0: COUNT-ATOMS returned 3
; 3

; (count-atoms '(a () c))
;  0: (COUNT-ATOMS (A NIL C))
;    1: (COUNT-ATOMS A)
;    1: COUNT-ATOMS returned 1
;    1: (COUNT-ATOMS (NIL C))
;      2: (COUNT-ATOMS NIL)
;      2: COUNT-ATOMS returned 0
;      2: (COUNT-ATOMS (C))
;        3: (COUNT-ATOMS C)
;        3: COUNT-ATOMS returned 1
;        3: (COUNT-ATOMS NIL)
;        3: COUNT-ATOMS returned 0
;      2: COUNT-ATOMS returned 1
;    1: COUNT-ATOMS returned 1
;  0: COUNT-ATOMS returned 2
; 2

; (count-all-atoms '(a () c))
;  0: (COUNT-ALL-ATOMS (A NIL C))
;    1: (COUNT-ALL-ATOMS A 1)
;    1: COUNT-ALL-ATOMS returned 1
;    1: (COUNT-ALL-ATOMS (NIL C) 0)
;      2: (COUNT-ALL-ATOMS NIL 1)
;      2: COUNT-ALL-ATOMS returned 1
;      2: (COUNT-ALL-ATOMS (C) 0)
;        3: (COUNT-ALL-ATOMS C 1)
;        3: COUNT-ALL-ATOMS returned 1
;        3: (COUNT-ALL-ATOMS NIL 0)
;        3: COUNT-ALL-ATOMS returned 0
;      2: COUNT-ALL-ATOMS returned 1
;    1: COUNT-ALL-ATOMS returned 2
;  0: COUNT-ALL-ATOMS returned 3
; 3
