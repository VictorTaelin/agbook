module Base.BinTree.sum where

open import Base.BinTree.Type
open import Base.Nat.Type
open import Base.Nat.add

-- Calculates the sum of all values in a tree of natural numbers.
-- 1st: The tree to sum.
-- = The sum of all values in the tree.
sum : BinTree Nat -> Nat
sum Leaf         = Zero
sum (Node x l r) = x + (sum l + sum r)
