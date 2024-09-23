module Base.OrdMap.from-list where

import Base.TreeAVL.from-list as T
open import Base.List.Type
open import Base.OrdMap.Type
open import Base.Pair.Type
open import Base.Trait.Ord
open import Base.TreeAVL.Type

-- Converts a list of key-value pairs to an OrdMap.
-- - pairs: A list of key-value pairs.
-- = An OrdMap containing all the key-value pairs from the input list.
from-list : ∀ {K V : Set} → {{_ : Ord K}} → List (Pair K V) → OrdMap K V
from-list = T.from-list
