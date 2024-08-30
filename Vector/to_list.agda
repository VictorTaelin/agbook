module Vector.to_list where

open import Vector.Main
open import List.Main
open import Nat.Main

-- Converts a Vector to a List.
-- - A: the type of elements in the vector and resulting list.
-- - n: the length of the vector.
-- - xs: the input vector.
-- = A list containing all elements from the vector.
to_list : ∀ {A : Set} {n : Nat} → Vector A n → List A
to_list []       = []
to_list (x ∷ xs) = x , to_list xs
