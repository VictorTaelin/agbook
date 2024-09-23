module Base.TreeAVL.Type where

open import Base.Pair.Type
open import Base.TreeAVL.Balance.Type

-- Defines an AVL tree datatype.
-- - K: The type of keys stored in the tree.
-- - V: The type of values stored in the tree.
data AVL (K V : Set) : Set where
  Leaf : AVL K V
  Node : (key-value : Pair K V) → (balance : Balance) → (left : AVL K V) → (right : AVL K V) → AVL K V
