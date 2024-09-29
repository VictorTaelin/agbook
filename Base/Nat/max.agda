module Base.Nat.max where

open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.Trait.Ord

-- Returns the maximum of two natural numbers.
-- - m: The first natural number.
-- - n: The second natural number.
-- = The larger of m and n.
max : Nat → Nat → Nat
max m n = if m >= n then m else n
