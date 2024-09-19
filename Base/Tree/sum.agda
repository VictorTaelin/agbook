module Base.Tree.sum where

open import Base.Tree.Type
open import Base.Nat.Type
open import Base.Nat.add

-- Calculates the sum of all values in a tree of natural numbers.
-- - t: The tree to sum.
-- = The sum of all values in the tree.
sum : Tree Nat → Nat
sum Leaf                = Zero
sum (Node x left right) = x + (sum left + sum right)
