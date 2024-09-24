module Base.OrdSet.fold where

import Base.AVLTree.fold as AVL
open import Base.OrdSet.Type
open import Base.Pair.Type
open import Base.Unit.Type

-- Performs a fold operation over an OrdSet.
-- - f: The combining function.
-- - z: The initial value (for the empty set case).
-- - set: The OrdSet to fold over.
-- = The result of folding the set.
fold : ∀ {V A : Set} -> (V -> A -> A) -> A -> OrdSet V -> A
fold f z set = AVL.fold (λ p acc -> f (fst p) acc) z set
