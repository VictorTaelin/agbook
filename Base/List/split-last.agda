module Base.List.split-last where

open import Base.Bool.Bool
open import Base.List.List
open import Base.List.concat
open import Base.List.drop
open import Base.List.split-chunks
open import Base.List.unsnoc
open import Base.Maybe.Maybe
open import Base.Pair.Pair


-- Splits a list at the last element that satisfies the given predicate.
-- - pred: A predicate function that determines where to split the list.
-- - xs: The input list.
-- = A pair of lists: the part before the split element and the part after (excluding the split element).
split-last : ∀ {A : Set} → (A → Bool) → List A → Pair (List A) (List A)
split-last pred xs with unsnoc (split-chunks pred xs)
-- Empty list
... | ([] , None)        = [] , []
-- Impossible case
... | (init , None)      = concat init , []
-- No match
... | ([] , Some last)   = last , []
-- Match
... | (init , Some last) = concat init , drop 1 last
