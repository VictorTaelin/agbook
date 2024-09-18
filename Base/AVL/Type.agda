module Base.AVL.Type where

open import Base.AVL.Balance.Type

-- Defines an AVL tree datatype.
-- - A: The type of values stored in the tree.
data AVL (A : Set) : Set where
  Leaf : AVL A
  Node : (value : A) → (balance : Balance) → (left : AVL A) → (right : AVL A) → AVL A
