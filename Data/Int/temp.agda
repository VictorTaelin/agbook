-- add (Pos Zero)        n                 = n
-- add m                 (Pos Zero)        = m
-- add m                 (Pos (Succ n))    = inc (add m (Pos n))
-- add m                 (NegSuc (Succ n)) = dec (add m (NegSuc n))
-- add (Pos (Succ m))    n                 = inc (add (Pos m) n)
-- add (NegSuc (Succ m)) n                 = dec (add (NegSuc m) n)
--

