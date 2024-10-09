module ARC.DSL.Functions.pair where

open import ARC.DSL.Types.List.List
open import ARC.DSL.Types.Pair.Pair

-- Zips two lists into a list of pairs
-- - xs: The first list
-- - ys: The second list
-- = A list of pairs, where each pair contains elements from xs and ys at the same position
pair : ∀ {A B : Set} → List A → List B → List (Pair A B)
pair []        _         = []
pair _         []        = []
pair (x :: xs) (y :: ys) = (x , y) :: pair xs ys

