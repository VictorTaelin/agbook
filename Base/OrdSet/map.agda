module Base.OrdSet.map where

import Base.AVLTree.map-keys as AVL
open import Base.OrdSet.OrdSet
open import Base.Trait.Ord

map : ∀ {V A : Set} {{_ : Ord A}} -> (V -> A) -> OrdSet V -> OrdSet A
map = AVL.map-keys
