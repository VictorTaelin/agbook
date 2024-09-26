module Base.OrdSet.from-list where

import Base.AVLTree.from-list as T
open import Base.List.map
open import Base.List.List
open import Base.OrdSet.OrdSet
open import Base.Pair.Pair
open import Base.Trait.Ord
open import Base.Unit.Unit

-- Converts a list of elements to an OrdSet.
-- - elements: A list of elements to be added to the set.
-- = An OrdSet containing all the unique elements from the input list.
from-list : ∀ {V : Set} -> {{_ : Ord V}} -> List V -> OrdSet V
from-list l = T.from-list (map (λ v -> (v , unit)) l)
