module Base.Bits.sub where

open import Base.Bits.Bits
open import Base.Bits.dec

-- Performs subtraction of two Bits values.
-- - a: The 1st Bits value (minuend).
-- - b: The 2nd Bits value (subtrahend).
-- = A new Bits value representing the difference of a and b.
sub : Bits -> Bits -> Bits
sub E     _     = E
sub a     E     = a
sub (O a) (O b) = O (sub a b)
sub (O a) (I b) = I (dec (sub a b))
sub (I a) (O b) = I (sub a b)
sub (I a) (I b) = O (sub a b)

-- Infix operator for Bits subtraction
_-_ : Bits -> Bits -> Bits
_-_ = sub

infixl 6 _-_
