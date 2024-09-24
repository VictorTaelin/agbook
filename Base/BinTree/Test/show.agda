module Base.BinTree.Test.show where

open import Base.Equal.Type
open import Base.Nat.Trait.Show
open import Base.Nat.Type
open import Base.String.Type
open import Base.Trait.Show
open import Base.BinTree.Trait.Show
open import Base.BinTree.Type

test-show-leaf-nat : show (Leaf {A = Nat}) === "_"
test-show-leaf-nat = refl

test-show-complex-tree : show (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) === "{2, {1, _, _}, {3, _, _}}"
test-show-complex-tree = refl
