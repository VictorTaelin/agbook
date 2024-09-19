module Base.List.split-at where

open import Base.List.Type
open import Base.Nat.Type
open import Base.Pair.Type
open import Base.List.take
open import Base.List.drop

-- Splits a list into two parts at the specified index.
-- - n: The index at which to split the list.
-- - xs: The input list.
-- = A pair of lists: the first n elements and the rest.
split-at : ∀ {A : Set} → Nat → List A → Pair (List A) (List A)
split-at n xs = (take n xs , drop n xs)
