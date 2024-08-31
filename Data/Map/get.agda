module Data.Map.get where

open import Data.Map.Main
open import Data.Maybe.Main
open import Data.Tree.Main
open import Data.Bits.Main

-- Retrieves a value from the Map given a key.
-- - m: The Map to search in.
-- - k: The Bits key to look up.
-- = The value associated with the key, wrapped in Maybe.
get : ∀ {A : Set} → Map A → Bits → Maybe A
get (node val _   _  ) e     = val
get (node _   lft _  ) (o k) = get lft k
get (node _   _   rgt) (i k) = get rgt k
get leaf               _     = none
