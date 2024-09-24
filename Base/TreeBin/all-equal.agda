module Base.TreeBin.all-equal where

open import Base.TreeBin.Type
open import Base.Bool.Type
open import Base.Bool.and
open import Base.Trait.Eq
open import Base.TreeBin.fold

-- Checks if all values in a tree are equal.
-- - t: The tree to check.
-- = True if all values in the tree are equal, False otherwise.
all-equal : ∀ {A : Set} {{EqA : Eq A}} -> TreeBin A -> Bool
all-equal Leaf         = True
all-equal (Node x l r) = fold (λ y le re -> (x == y) && le && re) True (Node x l r)
