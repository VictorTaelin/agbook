module Base.BinTree.count where

open import Base.BinTree.BinTree
open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Trait.Eq

-- Counts the occurrences of a given value in a binary tree.
-- 1st: The value to count.
-- 2nd: The binary tree to search.
-- = The number of occurrences of the given value in the tree.
count : ∀ {A : Set} {{EqA : Eq A}} → A → BinTree A → Nat
count _ Leaf         = Zero
count x (Node y l r) = (if x == y then 1 else 0) + (count x l + count x r)

