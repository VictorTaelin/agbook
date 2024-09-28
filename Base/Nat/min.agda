module Base.Nat.min where

open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.Trait.Ord
open import Base.Trait.Ord

-- Returns the minimum of two natural numbers.
-- - m: The first natural number.
-- - n: The second natural number.
-- = The smaller of m and n.
min : Nat → Nat → Nat
min m n = if m <= n then m else n
