module Base.AVLTree.size where

open import Base.Nat.Nat
open import Base.Nat.add
open import Base.AVLTree.AVLTree

-- Calculates the size (number of nodes) of an AVL tree.
-- - tree: The AVL tree to calculate the size of.
-- = The number of nodes in the tree.
size : ∀ {K V : Set} → AVLTree K V → Nat
size Leaf                  = Zero
size (Node _ _ left right) = Succ (size left + size right)
