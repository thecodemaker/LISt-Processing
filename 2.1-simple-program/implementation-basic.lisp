
(defun sentence () (append (noun-phrase) (verb-phrase)))

;(defun noun-phrase () (append (Article) (Noun)))
(defun noun-phrase () (append (Article) (Adj*) (Noun) (PP*)))

(defun verb-phrase () (append (Verb) (noun-phrase)))

(defun Article () (one-of '(the a)))

(defun Noun () (one-of '(man ball woman table)))

(defun Verb () (one-of '(hit took saw liked)))

(defun PP* () 
  (if (random-elt '(t nil))
    (append (PP) (PP*))
    nil
  )
)
(defun PP () (append (Prep) (noun-phrase)))

(defun Adj* () 
  (if (= (random 2) 0)
    nil
    (append (Adj) (Adj*))
  )
)
(defun Adj () (one-of '(big little blue green)))

(defun Prep () (one-of '(to in by with on)))

(defun one-of (set)
  "Pick one element from set and make a list from it."
  (list (random-elt set))
)

(defun random-elt (choices)
  "Choose an element from a list at random."
  (elt choices (random (length choices)))
)

; (trace sentence noun-phrase verb-phrase Article Noun Verb)

; (sentence)
;  0: (SENTENCE)
;    1: (NOUN-PHRASE)
;      2: (ARTICLE)
;      2: ARTICLE returned (A)
;      2: (NOUN)
;      2: NOUN returned (BALL)
;    1: NOUN-PHRASE returned (A BALL)
;    1: (VERB-PHRASE)
;      2: (VERB)
;      2: VERB returned (TOOK)
;      2: (NOUN-PHRASE)
;        3: (ARTICLE)
;        3: ARTICLE returned (THE)
;        3: (NOUN)
;        3: NOUN returned (TABLE)
;      2: NOUN-PHRASE returned (THE TABLE)
;    1: VERB-PHRASE returned (TOOK THE TABLE)
;  0: SENTENCE returned (A BALL TOOK THE TABLE)

;  (trace sentence noun-phrase verb-phrase Article Noun Verb PP* PP Adj* Adj Prep)

; (sentence)
;  0: (SENTENCE)
;    1: (NOUN-PHRASE)
;      2: (ARTICLE)
;      2: ARTICLE returned (A)
;      2: (ADJ*)
;        3: (ADJ)
;        3: ADJ returned (GREEN)
;        3: (ADJ*)
;          4: (ADJ)
;          4: ADJ returned (BLUE)
;          4: (ADJ*)
;          4: ADJ* returned NIL
;        3: ADJ* returned (BLUE)
;      2: ADJ* returned (GREEN BLUE)
;      2: (NOUN)
;      2: NOUN returned (MAN)
;      2: (PP*)
;      2: PP* returned NIL
;    1: NOUN-PHRASE returned (A GREEN BLUE MAN)
;    1: (VERB-PHRASE)
;      2: (VERB)
;      2: VERB returned (LIKED)
;      2: (NOUN-PHRASE)
;        3: (ARTICLE)
;        3: ARTICLE returned (A)
;        3: (ADJ*)
;        3: ADJ* returned NIL
;        3: (NOUN)
;        3: NOUN returned (BALL)
;        3: (PP*)
;          4: (PP)
;            5: (PREP)
;            5: PREP returned (TO)
;            5: (NOUN-PHRASE)
;              6: (ARTICLE)
;              6: ARTICLE returned (THE)
;              6: (ADJ*)
;              6: ADJ* returned NIL
;              6: (NOUN)
;              6: NOUN returned (BALL)
;              6: (PP*)
;              6: PP* returned NIL
;            5: NOUN-PHRASE returned (THE BALL)
;          4: PP returned (TO THE BALL)
;          4: (PP*)
;            5: (PP)
;              6: (PREP)
;              6: PREP returned (WITH)
;              6: (NOUN-PHRASE)
;                7: (ARTICLE)
;                7: ARTICLE returned (A)
;                7: (ADJ*)
;                  8: (ADJ)
;                  8: ADJ returned (BLUE)
;                  8: (ADJ*)
;                  8: ADJ* returned NIL
;                7: ADJ* returned (BLUE)
;                7: (NOUN)
;                7: NOUN returned (WOMAN)
;                7: (PP*)
;                7: PP* returned NIL
;              6: NOUN-PHRASE returned (A BLUE WOMAN)
;            5: PP returned (WITH A BLUE WOMAN)
;            5: (PP*)
;              6: (PP)
;                7: (PREP)
;                7: PREP returned (TO)
;                7: (NOUN-PHRASE)
;                  8: (ARTICLE)
;                  8: ARTICLE returned (THE)
;                  8: (ADJ*)
;                  8: ADJ* returned NIL
;                  8: (NOUN)
;                  8: NOUN returned (BALL)
;                  8: (PP*)
;                  8: PP* returned NIL
;                7: NOUN-PHRASE returned (THE BALL)
;              6: PP returned (TO THE BALL)
;              6: (PP*)
;                7: (PP)
;                  8: (PREP)
;                  8: PREP returned (ON)
;                  8: (NOUN-PHRASE)
;                    9: (ARTICLE)
;                    9: ARTICLE returned (A)
;                    9: (ADJ*)
;                    9: ADJ* returned NIL
;                    9: (NOUN)
;                    9: NOUN returned (WOMAN)
;                    9: (PP*)
;                    9: PP* returned NIL
;                  8: NOUN-PHRASE returned (A WOMAN)
;                7: PP returned (ON A WOMAN)
;                7: (PP*)
;                7: PP* returned NIL
;              6: PP* returned (ON A WOMAN)
;            5: PP* returned (TO THE BALL ON A WOMAN)
;          4: PP* returned (WITH A BLUE WOMAN TO THE BALL ON A WOMAN)
;        3: PP* returned (TO THE BALL WITH A BLUE WOMAN TO THE BALL ON A WOMAN)
;      2: NOUN-PHRASE returned
;           (A BALL TO THE BALL WITH A BLUE WOMAN TO THE BALL ON A WOMAN)
;    1: VERB-PHRASE returned
;         (LIKED A BALL TO THE BALL WITH A BLUE WOMAN TO THE BALL ON A WOMAN)
;  0: SENTENCE returned
;       (A GREEN BLUE MAN LIKED A BALL TO THE BALL WITH A BLUE WOMAN TO THE BALL
;        ON A WOMAN)
;(A GREEN BLUE MAN LIKED A BALL TO THE BALL WITH A BLUE WOMAN TO THE BALL ON A
; WOMAN)
