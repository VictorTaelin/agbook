module Base.AVLTree.minimum where

open import Base.Maybe.Type
open import Base.Pair.Type
open import Base.AVLTree.Type

-- Retrieves the minimum key-value pair from an AVL tree.
-- - tree: The AVL tree to search in.
-- = Some (key, value) if the tree is not empty, None otherwise.
minimum : ∀ {K V : Set} → AVLTree K V → Maybe (Pair K V)
minimum Leaf                   = None
minimum (Node kv _ Leaf _    ) = Some kv
minimum (Node _  _ left right) = minimum left
