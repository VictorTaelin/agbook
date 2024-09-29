module Base.Bits.or where

open import Base.Bits.Bits

-- Performs bitwise OR operation on two Bits values.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = A new Bits value representing the bitwise OR of a and b.
or : Bits → Bits → Bits
or E     E     = E
or E     b     = b
or a     E     = a
or (O a) (O b) = O (or a b)
or (O a) (I b) = I (or a b)
or (I a) (O b) = I (or a b)
or (I a) (I b) = I (or a b)

-- Infix operator for bitwise OR
_||_ : Bits → Bits → Bits
_||_ = or

infixr 5 _||_
