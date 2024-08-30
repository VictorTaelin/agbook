module Pair.fst where

open import Pair.Main

-- Extracts the 1st element from a Pair.
-- - pair: the input Pair.
-- = The 1st element of the Pair.
fst : ∀ {A B : Set} → Pair A B → A
fst (x , _) = x
