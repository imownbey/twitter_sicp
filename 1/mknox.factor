! square and sum-square procedures
: sqr ( x -- x^2 ) dup * ; ! already in factor as sq
: sum-sq.1 ( x y -- x^2+y^2 ) sqr swap sqr + ;
: sum-sq ( x y -- x^2+y^2 ) [ sqr ] bi@ + ;

! square roots by newton's method.
: avg ( x y -- avg ) + 2 / ;
: improve ( x guess -- x better-guess ) 2dup / avg ;
: good-enough? ( x guess -- bool ) sqr - abs 0.1 < ;
: sqrt-iter ( x guess -- x sqrt(x) ) [ 2dup good-enough? ] [ improve ] until ;
: sqrt ( x -- sqrt(x) ) 1.0 sqrt-iter swap drop ;
