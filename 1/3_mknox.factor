: top2 ( a b c -- d e ) 2dup < [ swap ] unless [ max ] curry bi@ ;
: square ( x -- y ) dup * ;
: sum-top2-squared ( a b c -- d ) top2 [ square ] bi@ + ;
