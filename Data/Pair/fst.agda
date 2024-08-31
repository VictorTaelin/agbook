module Data.Pair.fst where

open import Data.Pair.Type

-- Extracts the 1st element from a Pair.
-- - pair: The input Pair.
-- = The 1st element of the Pair.
fst : ∀ {A B : Set} → Pair A B → A
fst (x , _) = x
