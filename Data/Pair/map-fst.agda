module Data.Pair.map-fst where

open import Data.Pair.Type

-- Applies a function to the first element of a Pair.
-- - fn: The function to be applied to the first element.
-- - pair: The input Pair.
-- = A new Pair with the first element unchanged and the first element transformed by fn.
map-fst : ∀ {A B C : Set} → (A → C) → Pair A B → Pair C B
map-fst f (x , y) = f x , y
