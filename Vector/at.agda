module Vector.at where

open import Vector.Main
open import Nat.Main
open import Nat.less
open import Maybe.Main

-- Retrieves the element at the specified index in the vector.
-- - A: the type of elements in the vector.
-- - n: the length of the vector.
-- - xs: the input vector.
-- - i: the index to retrieve.
-- = Just the element at index i if i < n.
at : ∀ {A : Set} {n : Nat} → Vector A n → (i : Nat) → Maybe A
at []       _       = none
at (x ∷ _)  zero    = some x
at (_ ∷ xs) (succ i) = at xs i
