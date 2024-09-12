module Data.Tree.Test.show where

open import Data.Tree.Type
open import Data.Tree.show
open import Data.String.Type
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Equal.Type

-- Show tests
_ : show (Leaf) === "_"
_ = refl

_ : show (Leaf {A = Nat}) === "_"
_ = refl

_ : show (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) === "{2, {1, _, _}, {3, _, _}}"
_ = refl