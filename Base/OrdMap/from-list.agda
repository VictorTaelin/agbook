module Base.OrdMap.from-list where

open import Base.OrdMap.Type
open import Base.List.Type
open import Base.Pair.Type
open import Base.AVL.Type
import Base.AVL.from-list as T
open import Base.Ord.Trait

-- Converts a list of key-value pairs to an OrdMap.
-- - pairs: A list of key-value pairs.
-- = An OrdMap containing all the key-value pairs from the input list.
from-list : ∀ {K V : Set} → {{_ : Ord K}} → List (Pair K V) → OrdMap K V
from-list = T.from-list
