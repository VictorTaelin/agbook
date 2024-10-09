module Base.Int.to-nat where

open import Base.Int.Int
open import Base.Nat.Nat
open import Base.Nat.add

-- Converts an integer to a natural number.
-- - i: The integer to convert.
-- = The corresponding natural number representation.
--   For negative integers, returns 0.
to-nat : Int → Nat
to-nat (Pos n)    = n
to-nat (NegSuc _) = Zero

