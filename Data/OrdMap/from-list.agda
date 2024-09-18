module Data.OrdMap.from-list where

open import Data.OrdMap.Type
open import Data.List.Type
open import Data.Pair.Type
open import Data.AVL.Type
import Data.AVL.from-list as T
open import Data.Trait.Ord

-- Converts a list of key-value pairs to an OrdMap.
-- - pairs: A list of key-value pairs.
-- = An OrdMap containing all the key-value pairs from the input list.
from-list : ∀ {K V : Set} → {{_ : Ord K}} → List (Pair K V) → OrdMap K V
from-list = T.from-list
