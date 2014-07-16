
(defparameter *titles* 
  '(Mr Mrs Miss Ms Sir Madam Dr Admiral Major General)
  "A list of titles that can appear at the start of a name."
)

(defun first-name (name)
  "Select the first name from a name represented as a list."
  (if (member (first name) *titles*)
    (first-name (rest name))
    (first name)
  )
)

; (first-name '(Madam Major General Paula Jones))
; PAULA

; (trace first-name)

; (first-name '(Madam Major General Paula Jones))
;   0: (FIRST-NAME (MADAM MAJOR GENERAL PAULA JONES))
;   1: (FIRST-NAME (MAJOR GENERAL PAULA JONES))
;     2: (FIRST-NAME (GENERAL PAULA JONES))
;       3: (FIRST-NAME (PAULA JONES))
;       3: FIRST-NAME returned PAULA
;     2: FIRST-NAME returned PAULA
;    1: FIRST-NAME returned PAULA
;  0: FIRST-NAME returned PAULA
; PAULA

; (untrace first-name)
