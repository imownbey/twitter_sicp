let ident x = x ;;

let nxt x = x + 1 ;;

let add x y = x + y ;;

let rec accumulate f nullv term a b next =
  if a > b then nullv
  else accumulate f (f (term a) nullv) term (next a) b next ;;
