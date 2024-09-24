module Base.Bits.lshift where

open import Base.Bits.Type
open import Base.Nat.Type

-- Performs left shift operation on a Bits value.
-- - bits: The input Bits value.
-- - n: The number of positions to shift left (represented as Nat).
-- = A new Bits value representing the left-shifted result.
lshift : Bits -> Nat -> Bits
lshift bits Zero     = bits
lshift E    _        = E
lshift bits (Succ n) = lshift (O bits) n

-- Infix operator for left shift
_<<_ : Bits -> Nat -> Bits
_<<_ = lshift

infixl 8 _<<_
