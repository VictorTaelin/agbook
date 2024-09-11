module Data.Vector.at where

open import Data.Vector.Type
open import Data.Nat.Type
open import Data.Nat.lt
open import Data.Maybe.Type
open import Data.List.Type
open import Data.List.append

-- Retrieves the element at the specified index in the vector.
-- - A: The type of elements in the vector.
-- - n: The length of the vector.
-- - xs: The input vector.
-- - i: The index to retrieve.
-- = Just the element at index i if i < n.
at : ∀ {A : Set} {n : Nat} → Vector A n → (i : Nat) → Maybe A
at []        _        = None
at (x :: _)  Zero     = Some x
at (_ :: xs) (Succ i) = at xs i

