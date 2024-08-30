module Vector.append where

open import Vector.Main
open import Nat.Main
open import Nat.add

-- Concatenates two vectors.
-- - xs: the 1st vector.
-- - ys: the 2nd vector.
-- = A new vector containing all elements from xs followed by all elements from ys.
_++_ : ∀ {A : Set} {m n : Nat} → Vector A m → Vector A n → Vector A (m + n)
[]       ++ ys = ys
(x ∷ xs) ++ ys = x ∷ (xs ++ ys)

infixr 5 _++_
