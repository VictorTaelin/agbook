module Data.Vector.at where

open import Data.Vector.Main
open import Data.Nat.Main
open import Data.Nat.less
open import Data.Maybe.Main

-- Retrieves the element at the specified index in the vector.
-- - A: The type of elements in the vector.
-- - n: The length of the vector.
-- - xs: The input vector.
-- - i: The index to retrieve.
-- = Just the element at index i if i < n.
at : ∀ {A : Set} {n : Nat} → Vector A n → (i : Nat) → Maybe A
at []        _        = none
at (x :: _)  zero     = some x
at (_ :: xs) (succ i) = at xs i
