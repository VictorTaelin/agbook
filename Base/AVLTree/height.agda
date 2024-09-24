module Base.AVLTree.height where

open import Base.Nat.max
open import Base.Nat.Type
open import Base.AVLTree.Type

-- Calculates the height of an AVL tree.
-- - tree: The AVL tree to calculate the height of.
-- = The height of the tree (number of levels).
height : ∀ {K V : Set} -> AVL K V -> Nat
height Leaf = Zero
height (Node _ _ left right) = Succ (max (height left) (height right))
