module Base.Bits.add where

open import Base.Bits.Bits
open import Base.Bits.inc

-- Performs addition of two Bits values.
-- - a: The 1st Bits value.
-- - b: The 2nd Bits value.
-- = A new Bits value representing the sum of a and b.
add : Bits -> Bits -> Bits
add E     b     = b
add a     E     = a
add (O a) (O b) = O (add a b)
add (O a) (I b) = I (add a b)
add (I a) (O b) = I (add a b)
add (I a) (I b) = O (inc (add a b))

-- Infix operator for Bits addition
_+_ : Bits -> Bits -> Bits
_+_ = add

infixl 6 _+_
