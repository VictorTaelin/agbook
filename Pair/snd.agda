module Pair.snd where

open import Pair.Main

-- Extracts the second element from a Pair
-- - pair: the input Pair
-- = the second element of the Pair
snd : ∀ {A B : Set} → Pair A B → B
snd (_ , y) = y
