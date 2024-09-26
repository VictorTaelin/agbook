module Base.BinTree.Test.eq where

open import Base.BinTree.Trait.Eq
open import Base.BinTree.BinTree
open import Base.Bool.Bool
open import Base.Equal.Equal
open import Base.Nat.Trait.Eq
open import Base.Nat.Nat
open import Base.Trait.Eq

test-eq-same-tree : ((Node 1 Leaf Leaf) == (Node 1 Leaf Leaf)) ≡ True
test-eq-same-tree = refl

test-neq-same-tree : (Node 1 (Node 2 Leaf Leaf) Leaf != Node 1 (Node 2 Leaf Leaf) Leaf) ≡ False
test-neq-same-tree = refl

test-eq-different-root : ((Node 1 Leaf Leaf) == Node 2 Leaf Leaf) ≡ False
test-eq-different-root = refl

test-neq-leaf-node : (Leaf != (Node 1 Leaf Leaf)) ≡ True
test-neq-leaf-node = refl
