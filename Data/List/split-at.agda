module Data.List.split-at where

open import Data.List.Type
open import Data.Nat.Type
open import Data.Pair.Type
open import Data.List.take
open import Data.List.drop

-- Splits a list into two parts at the specified index.
-- - n: The index at which to split the list.
-- - xs: The input list.
-- = A pair of lists: the first n elements and the rest.
split-at : ∀ {A : Set} → Nat → List A → Pair (List A) (List A)
split-at n xs = (take n xs , drop n xs)
