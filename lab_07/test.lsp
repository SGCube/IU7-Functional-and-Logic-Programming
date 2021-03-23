(defun test (result expected)
    (print (equal result expected))
)

(format T "1) palindrom")
(mapcar #'test (list 
    (palindrom '(A B B C B B A))
    (palindrom '(A B B C C B B A))
    (palindrom '(A B B C C B D A))
    (palindrom '(A B B C C B B C C B B A))
    (palindrom '(A A))
    (palindrom '(B A))
    (palindrom '(A))
    (palindrom '())
) '(T T Nil T T Nil T T)
)

(format T "~%~%2) set-equal")
(mapcar #'test (list
    (set-equal '() '())
    (set-equal '(A B) '())
    (set-equal '() '(A B))
    (set-equal '(A B C) '(A B C))
    (set-equal '(A B C) '(C A B))
    (set-equal '(A E D C B) '(A E F C D))
    (set-equal '(A E D C B) '(A E C D))
    (set-equal '(A E D) '(A E F C D))
) '(T Nil Nil T T Nil Nil Nil)
)

(format T "~%~%3.1) get-capital")
(mapcar #'test (list
    (get-capital 'Japan '())
    (get-capital 'Japan '((Japan . Tokio)))
    (get-capital 'Japan '((Russia . Moscow)))
    (get-capital 'Russia '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
    (get-capital 'USA '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
    (get-capital 'Japan '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
    (get-capital 'Germany '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
) '(Nil Tokio Nil Moscow Washington Tokio Nil)
)
(format T "~%3.2) get-state")
(mapcar #'test (list
    (get-state 'Moscow '())
    (get-state 'Moscow '((Russia . Moscow)))
    (get-state 'Moscow '((Japan . Tokio)))
    (get-state 'Moscow '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
    (get-state 'London '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
    (get-state 'Tokio '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
    (get-state 'Berlin '((Russia . Moscow) (UK . London) (USA . Washington) (Japan . Tokio)))
) '(Nil Russia Nil Russia UK Japan Nil)
)