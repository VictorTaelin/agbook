module Base.OrdSet.minimum where

import Base.AVLTree.minimum as AVL
open import Base.Maybe.Type
open import Base.OrdSet.Type
open import Base.Pair.Type

-- Retrieves the minimum element from an OrdSet.
-- - set: The OrdSet to search in.
-- = Some v if the set is not empty, None otherwise.
minimum : ∀ {V : Set} → OrdSet V → Maybe V
minimum set with AVL.minimum set
... | Some pair = Some (fst pair)
... | None = None
