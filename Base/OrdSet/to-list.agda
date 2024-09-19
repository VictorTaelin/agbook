module Base.OrdSet.to-list where

open import Base.OrdSet.Type
open import Base.List.Type
open import Base.Pair.Type
import Base.AVL.keys as AVL

-- Extracts all elements from an OrdSet into a list.
-- - set: The OrdSet to extract elements from.
-- = A list containing all elements from the set.
values : ∀ {V : Set} → OrdSet V → List V
values set = AVL.keys set
