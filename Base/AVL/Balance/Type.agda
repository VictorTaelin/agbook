module Base.AVL.Balance.Type where

-- Represents the balance factor of an AVL tree node.
-- - -one: Left subtree is taller by 1.
-- - zero: Left and right subtrees have the same height.
-- - +one: Right subtree is taller by 1.
data Balance : Set where
  -one : Balance
  zero : Balance
  +one : Balance
