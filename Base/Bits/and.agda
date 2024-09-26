module Base.Bits.and where

open import Base.Bits.Bits

-- Performs bitwise AND operation on two Bits values.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = A new Bits value representing the bitwise AND of a and b.
and : Bits -> Bits -> Bits
and E     E     = E
and E     b     = E
and a     E     = E
and (O a) (O b) = O (and a b)
and (O a) (I b) = O (and a b)
and (I a) (O b) = O (and a b)
and (I a) (I b) = I (and a b)

-- Infix operator for bitwise AND
_&&_ : Bits -> Bits -> Bits
_&&_ = and

infixr 6 _&&_
