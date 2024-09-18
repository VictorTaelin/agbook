module Data.OrdSet.from-list where

open import Data.OrdSet.Type
open import Data.List.Type
open import Data.List.map
open import Data.Pair.Type
open import Data.Unit.Type
open import Data.Trait.Ord
import Data.AVL.from-list as T

-- Converts a list of elements to an OrdSet.
-- - elements: A list of elements to be added to the set.
-- = An OrdSet containing all the unique elements from the input list.
from-list : ∀ {V : Set} → {{_ : Ord V}} → List V → OrdSet V
from-list l = T.from-list (map (λ v → (v , unit)) l)
