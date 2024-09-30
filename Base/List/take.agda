module Base.List.take where

open import Base.List.List
open import Base.Nat.Nat

-- Takes the first n elements from a list.
-- If n is greater than the length of the list, returns the entire list.
-- - n: The number of elements to take.
-- - xs: The input list.
-- = A list containing the first n elements of xs, or all of xs if n > length xs.
take : ∀ {A : Set} → Nat → List A → List A
take Zero     _         = []
take (Succ _) []        = []
take (Succ n) (x :: xs) = x :: take n xs
