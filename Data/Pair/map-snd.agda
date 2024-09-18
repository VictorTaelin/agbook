module Data.Pair.map-snd where

open import Data.Pair.Type

-- Applies a function to the second element of a Pair.
-- - fn: The function to be applied to the second element.
-- - pair: The input Pair.
-- = A new Pair with the first element unchanged and the second element transformed by fn.
map-snd : ∀ {A B C : Set} → (B → C) → Pair A B → Pair A C
map-snd f (x , y) = x , f y
