module Base.List.zip where

open import Base.List.List
open import Base.List.zip-with
open import Base.Pair.Pair

-- Zips two lists into a single list of pairs.
-- - xs: The first input list.
-- - ys: The second input list.
-- = A new list where each element is a pair of corresponding elements from xs and ys.
zip : ∀ {A B : Set} -> List A -> List B -> List (Pair A B)
zip = zip-with _,_
