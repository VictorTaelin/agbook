module Base.Tree.Test.eq where

open import Base.Tree.Type
open import Base.Tree.eq
open import Base.Bool.Type
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Equal.Type

test-eq-same-tree : ((Node 1 Leaf Leaf) == (Node 1 Leaf Leaf)) === True
test-eq-same-tree = refl

test-neq-same-tree : (Node 1 (Node 2 Leaf Leaf) Leaf != Node 1 (Node 2 Leaf Leaf) Leaf) === False
test-neq-same-tree = refl

test-eq-different-root : ((Node 1 Leaf Leaf) == Node 2 Leaf Leaf) === False
test-eq-different-root = refl

test-neq-leaf-node : (Leaf != (Node 1 Leaf Leaf)) === True
test-neq-leaf-node = refl
