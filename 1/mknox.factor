: square ( x -- x^2 ) dup * ; ! already in factor as sq
: sum-sq.1 ( x y -- x^2+y^2 ) square swap square + ;
: sum-sq.1 ( x y -- x^2+y^2 ) [ square ] bi@ + ;
