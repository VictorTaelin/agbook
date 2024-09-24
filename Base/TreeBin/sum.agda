module Base.TreeBin.sum where

open import Base.Nat.add
open import Base.Nat.Type
open import Base.TreeBin.Type

-- Calculates the sum of all values in a tree of natural numbers.
-- - t: The tree to sum.
-- = The sum of all values in the tree.
sum : TreeBin Nat -> Nat
sum Leaf                = Zero
sum (Node x left right) = x + (sum left + sum right)
