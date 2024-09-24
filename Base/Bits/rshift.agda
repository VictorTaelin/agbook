module Base.Bits.rshift where

open import Base.Bits.Type
open import Base.Nat.Type

-- Performs right shift operation on a Bits value.
-- - bits: The input Bits value.
-- - n: The number of positions to shift right (represented as Nat).
-- = A new Bits value representing the right-shifted result.
rshift : Bits -> Nat -> Bits
rshift bits     Zero     = bits
rshift E        _        = E
rshift (O bits) (Succ n) = rshift bits n
rshift (I bits) (Succ n) = rshift bits n

-- Infix operator for right shift
_>>_ : Bits -> Nat -> Bits
_>>_ = rshift

infixl 8 _>>_
