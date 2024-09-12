module Data.Tree.Test.show where

open import Data.Tree.Type
open import Data.Tree.show
open import Data.String.Type
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Equal.Type

test-show-leaf : show (Leaf) === "_"
test-show-leaf = refl

test-show-leaf-nat : show (Leaf {A = Nat}) === "_"
test-show-leaf-nat = refl

test-show-complex-tree : show (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) === "{2, {1, _, _}, {3, _, _}}"
test-show-complex-tree = refl