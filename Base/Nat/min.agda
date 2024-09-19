module Base.Nat.min where

open import Base.Nat.Type
open import Base.Bool.if
open import Base.Nat.Ord
open import Base.Trait.Ord

-- Returns the minimum of two natural numbers.
-- - x: The first natural number.
-- - y: The second natural number.
-- = The smaller of x and y.
min : Nat → Nat → Nat
min x y = if (_<=_ {{OrdNat}} x y) then x else y
