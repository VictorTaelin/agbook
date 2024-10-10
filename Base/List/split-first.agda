module Base.List.split-first where

open import Base.List.List
open import Base.Bool.Bool
open import Base.Pair.Pair
open import Base.Function.case

-- Splits a list at the first element that satisfies the given predicate.
-- - pred: A predicate function that determines where to split the list.
-- - xs: The input list.
-- = A pair of lists: the part before the split element and the part after (excluding the split element).
split-first : ∀ {A : Set} → (A → Bool) → List A → Pair (List A) (List A)
split-first pred [] = [] , []
split-first pred (x :: xs) = case pred x of λ where
  True  → [] , xs
  False → case split-first pred xs of λ where
    (before , after) → (x :: before) , after

