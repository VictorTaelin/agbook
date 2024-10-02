module Base.Pair.to-list where

open import Base.Pair.Pair
open import Base.List.List

-- Converts a pair of elements into a list.
-- 1st: The input pair to convert.
-- = A list containing the two elements of the pair.
to-list : ∀ {a} {A : Set a} → Pair A A → List A
to-list (x , y) = x :: y :: []