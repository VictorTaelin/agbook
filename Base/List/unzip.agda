module Base.List.unzip where

open import Base.List.List
open import Base.List.unzip-with
open import Base.Pair.Pair

-- Unzips a list of pairs into two separate lists.
-- - xs: The input list of pairs to unzip.
-- = A pair of lists, where the first list contains all first elements of the pairs,
--   and the second list contains all second elements of the pairs.
unzip : ∀ {A B : Set} → List (Pair A B) → Pair (List A) (List B)
unzip = unzip-with (λ x → x)
