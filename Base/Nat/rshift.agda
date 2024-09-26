module Base.Nat.rshift where

open import Base.Nat.Nat
open import Base.Nat.div
open import Base.Nat.mul
open import Base.Nat.exp

-- Performs right shift operation on a natural number.
-- - n: The input natural number.
-- - shift: The number of positions to shift right.
-- = A new natural number representing the right-shifted result.
rshift : Nat -> Nat -> Nat
rshift n shift = div n (2 ** shift)

-- Infix operator for right shift
_>>_ : Nat -> Nat -> Nat
_>>_ = rshift

infixl 8 _>>_
