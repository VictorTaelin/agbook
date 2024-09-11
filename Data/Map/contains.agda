module Data.Map.contains where

open import Data.Map.Type
open import Data.Bits.Type
open import Data.Maybe.Type
open import Data.Tree.Type
open import Data.Bool.Type

-- Checks if a key exists in the Map.
-- - m: The Map to search in.
-- - k: The Bits key to look for.
-- = True if the key exists in the Map, False otherwise.
contains : ∀ {A : Set} → Map A → Bits → Bool
contains (Node (Some _) _   _  ) E     = True
contains (Node None     _   _  ) E     = False
contains (Node _        lft _  ) (O k) = contains lft k
contains (Node _        _   rgt) (I k) = contains rgt k
contains Leaf                   _      = False
