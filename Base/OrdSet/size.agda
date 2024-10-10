module Base.OrdSet.size where

open import Base.OrdSet.OrdSet
import Base.AVLTree.size as AVLTree
open import Base.Nat.Nat

-- Calculates the size (number of elements) of an OrdSet.
-- - set: The OrdSet to calculate the size of.
-- = The number of elements in the set.
size : ∀ {V : Set} → OrdSet V → Nat
size = AVLTree.size

