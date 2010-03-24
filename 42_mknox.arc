; composition is actually built-in to arc. (f:g x) == (f (g x))
; if you wanted to implement your own composition function, it would look like:

(def compose (f g) [f (g _)])

