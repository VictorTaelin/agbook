module Data.Pair.snd where

open import Data.Pair.Type

-- Extracts the 2nd element from a Pair.
-- - pair: The input Pair.
-- = The 2nd element of the Pair.
snd : ∀ {A B : Set} → Pair A B → B
snd (_ , y) = y
