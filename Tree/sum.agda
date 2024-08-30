module Tree.sum where

open import Tree.Main
open import Nat.Main
open import Nat.add

-- Calculates the sum of all values in a tree of natural numbers
-- - t: the tree to sum
-- = the sum of all values in the tree
sum : Tree Nat → Nat
sum leaf = zero
sum (node x left right) = x + (sum left + sum right)
