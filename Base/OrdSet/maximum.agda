module Base.OrdSet.maximum where

import Base.AVLTree.maximum as AVL
open import Base.Maybe.Maybe
open import Base.OrdSet.OrdSet
open import Base.Pair.Pair

-- Retrieves the maximum element from an OrdSet.
-- - set: The OrdSet to search in.
-- = Some v if the set is not empty, None otherwise.
maximum : ∀ {V : Set} → OrdSet V → Maybe V
maximum set with AVL.maximum set
... | Some pair = Some (fst pair)
... | None = None

