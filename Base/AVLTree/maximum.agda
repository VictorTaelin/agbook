module Base.AVLTree.maximum where

open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.AVLTree.Type

-- Retrieves the maximum key-value pair from an AVL tree.
-- - tree: The AVL tree to search in.
-- = Some (key, value) if the tree is not empty, None otherwise.
maximum : ∀ {K V : Set} → AVLTree K V → Maybe (Pair K V)
maximum Leaf                     = None
maximum (Node kv _ _    Leaf)    = Some kv
maximum (Node _  _ left right)   = maximum right
