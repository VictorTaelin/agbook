module Pair.snd where

open import Pair.Main

-- Extracts the 2nd element from a Pair.
-- - pair: the input Pair.
-- = The 2nd element of the Pair.
snd : ∀ {A B : Set} → Pair A B → B
snd (_ , y) = y
