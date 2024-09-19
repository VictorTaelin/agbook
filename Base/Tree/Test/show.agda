module Base.Tree.Test.show where

open import Base.Tree.Type
open import Base.Tree.show
open import Base.String.Type
open import Base.Nat.Type
open import Base.Nat.show
open import Base.Equal.Type

test-show-leaf : show (Leaf) === "_"
test-show-leaf = refl

test-show-leaf-nat : show (Leaf {A = Nat}) === "_"
test-show-leaf-nat = refl

test-show-complex-tree : show (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) === "{2, {1, _, _}, {3, _, _}}"
test-show-complex-tree = refl