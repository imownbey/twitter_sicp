zero = \x -> x
one  = \x -> \x -> x
two  = \x -> \x -> \x -> x

add m n = \f -> \x -> (m f) $ (n f) x