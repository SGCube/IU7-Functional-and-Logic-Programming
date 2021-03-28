; 5.7

(defun multiply-by-numb (lst k)
    (cond
        ((null lst) Nil)
        (T (cons (* (car lst) k)
            (multiply-by-numb (cdr lst) k))
        )
    )
)

(defun multiply-by (lst k)
    (if (null lst) Nil
        (cons
            (cond
                ((listp (car lst)) (multiply-by (car lst) k))
                ((numberp (car lst)) (* (car lst) k))
                (T (car lst))
            )
            (multiply-by (cdr lst) k)
        )
    )
)

(defun multiply-by-numb-f (lst k)
    (mapcar #'(lambda (x) (* x k)) lst)
)

(defun multiply-by-f (lst k) 
    (mapcar #'(lambda (x)
            (cond
                ((listp x) (multiply-by x k))
                ((numberp x) (* x k))
                (T x)
            )
        )
        lst
    )
)

; 5.8

(defun add-to-sorted-asc (lst x)
    (cond
        ((null lst) (cons x Nil))
        ((< x (car lst)) (cons x lst))
        (T (cons (car lst) (add-to-sorted-asc (cdr lst) x)))
    )
)

(defun is-between (x a b)
    (and (<= a x) (<= x b))
)

(defun sel-between-r (lst a b res)
    (if (null lst) res
        (sel-between-r (cdr lst) a b 
            (if (is-between (car lst) a b)
                (add-to-sorted-asc res (car lst))
                res
            )
        )
    )
)

(defun select-between (lst a b)
    (cond
        ((null lst) Nil)
        ((> a b) (sel-between-r lst b a Nil))
        (T (sel-between-r lst a b Nil))
    )
)

(defun sel-between-f (lst a b)
	(reduce #'(lambda (xlst x)
            (cond
                ((not (is-between x a b)) xlst)
                ((null xlst) (cons x Nil))
                (T (add-to-sorted-asc xlst x))
            )
        )
		lst
        :initial-value Nil
    )
)

(defun select-between-f (lst a b)
    (cond
        ((null lst) Nil)
        ((> a b) (sel-between-f lst b a))
        (T (sel-between-f lst a b))
    )
)

; 6.2

(defun decrease-by-10 (lst)
    (if (null lst) Nil
        (cons
            (cond
                ((listp (car lst)) (decrease-by-10 (car lst)))
                ((numberp (car lst)) (- (car lst) 10))
                (T (car lst))
            )
            (decrease-by-10 (cdr lst))
        )
    )
)

(defun decrease-by-10-f (lst)
    (mapcar #'(lambda (x) (cond
            ((listp x) (decrease-by-10-f x))
            ((numberp x) (- x 10))
            (T x)
            )
        ) lst
    )
)

; 6.3

(defun get-first-arg (lst) Nil)

; numb-sum

(defun sum-all-numbers (lst) 0)
