module Base.List.swap where

open import Base.List.List
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.Maybe.Maybe

-- Replaces an element at a specific index in a list and returns the old value.
-- - n: The index of the element to replace (0-based).
-- - x: The new value to insert at the specified index.
-- - xs: The input list.
-- = A pair containing the new list and the old value (if found).
swap : ∀ {A : Set} → Nat → A → List A → Pair (List A) (Maybe A)
swap Zero     y (x :: xs) = (y :: xs) , Some x
swap (Succ n) y (x :: xs) = let (xs , val) = swap n y xs in (x :: xs) , val
swap _        _ []        = [] , None

