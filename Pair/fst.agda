module Pair.fst where

open import Pair.Main

-- Extracts the first element from a Pair
-- - pair: the input Pair
-- = the first element of the Pair
fst : ∀ {A B : Set} → Pair A B → A
fst (x , _) = x
