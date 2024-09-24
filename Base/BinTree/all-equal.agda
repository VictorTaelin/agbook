module Base.BinTree.all-equal where

open import Base.BinTree.Type
open import Base.BinTree.fold
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Trait.Eq

-- Checks if all values in a tree are equal.
-- - t: The tree to check.
-- = True if all values in the tree are equal, False otherwise.
all-equal : ∀ {A : Set} {{EqA : Eq A}} -> BinTree A -> Bool
all-equal Leaf         = True
all-equal (Node x l r) = fold (λ y le re -> (x == y) && le && re) True (Node x l r)
