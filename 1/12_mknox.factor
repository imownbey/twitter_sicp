: next-pascal-row ( row -- row ) { 0 } append dup { 0 } swap append [ + ] 2map ;
: next-pascal-row ( row -- row ) [ { 0 } append ] [ { 0 } swap append ] bi append [ + ] 2map ;
: ntimes ( state quot n -- state ) [ dup 0 <= ] [ [ drop call ] 2keep 1 - ] until 2drop ; inline
: nth-pascal-row ( n -- row ) { 1 } [ next-pascal-row ] pick ntimes swap drop ;
