module Data.Vector.to_list where

open import Data.Vector.Type
open import Data.List.Type
open import Data.Nat.Type

-- Converts a Vector to a List.
-- - A: The type of elements in the vector and resulting list.
-- - n: The length of the vector.
-- - xs: The input vector.
-- = A list containing all elements from the vector.
to_list : ∀ {A : Set} {n : Nat} → Vector A n → List A
to_list []        = []
to_list (x :: xs) = x , to_list xs
