
(defun count-anywhere (item tree)
  "Count the times item appears anywhere within tree."
  (cond 
    ((eql item tree) 1)
    ((atom tree) 0)
    (t (+ (count-anywhere item (first tree)) (count-anywhere item (rest tree))))
  )
)

; (count-anywhere 'a '(a ((a) b) a))
;  0: (COUNT-ANYWHERE A (A ((A) B) A))
;    1: (COUNT-ANYWHERE A A)
;    1: COUNT-ANYWHERE returned 1
;    1: (COUNT-ANYWHERE A (((A) B) A))
;      2: (COUNT-ANYWHERE A ((A) B))
;        3: (COUNT-ANYWHERE A (A))
;          4: (COUNT-ANYWHERE A A)
;          4: COUNT-ANYWHERE returned 1
;          4: (COUNT-ANYWHERE A NIL)
;          4: COUNT-ANYWHERE returned 0
;        3: COUNT-ANYWHERE returned 1
;        3: (COUNT-ANYWHERE A (B))
;          4: (COUNT-ANYWHERE A B)
;          4: COUNT-ANYWHERE returned 0
;          4: (COUNT-ANYWHERE A NIL)
;          4: COUNT-ANYWHERE returned 0
;        3: COUNT-ANYWHERE returned 0
;      2: COUNT-ANYWHERE returned 1
;      2: (COUNT-ANYWHERE A (A))
;        3: (COUNT-ANYWHERE A A)
;        3: COUNT-ANYWHERE returned 1
;        3: (COUNT-ANYWHERE A NIL)
;        3: COUNT-ANYWHERE returned 0
;      2: COUNT-ANYWHERE returned 1
;    1: COUNT-ANYWHERE returned 2
;  0: COUNT-ANYWHERE returned 3
; 3

