module Base.OrdSet.union where

open import Base.OrdSet.Type
open import Base.Ord.Trait
import Base.AVL.union as AVL

-- Computes the union of two OrdSets.
-- - s1: The first OrdSet.
-- - s2: The second OrdSet.
-- = A new OrdSet containing all elements from both input sets,
--   with elements from s2 taking precedence in case of conflicts.
union : ∀ {V : Set} → {{_ : Ord V}} → OrdSet V → OrdSet V → OrdSet V
union = AVL.union

-- Infix notation for the union of two OrdSets.
-- - s1: The first OrdSet.
-- - s2: The second OrdSet.
-- = A new OrdSet containing all elements from both input sets,
--   with elements from s2 taking precedence in case of conflicts.
_∪_ : ∀ {V : Set} → {{_ : Ord V}} → OrdSet V → OrdSet V → OrdSet V
_∪_ = union

infixr 6 _∪_
