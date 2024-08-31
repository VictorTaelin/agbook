module Data.Map.get where

open import Data.Map.Type
open import Data.Maybe.Type
open import Data.Tree.Type
open import Data.Bits.Type

-- Retrieves a value from the Map given a key.
-- - m: The Map to search in.
-- - k: The Bits key to look up.
-- = The value associated with the key, wrapped in Maybe.
get : ∀ {A : Set} → Map A → Bits → Maybe A
get (Node val _   _  ) E     = val
get (Node _   lft _  ) (O k) = get lft k
get (Node _   _   rgt) (I k) = get rgt k
get Leaf               _     = None
