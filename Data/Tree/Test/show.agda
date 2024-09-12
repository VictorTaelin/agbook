module Data.Tree.Test.show where

open import Data.Tree.Type
open import Data.Tree.show
open import Data.String.Type
open import Data.Trait.Show
open import Data.Nat.Type
open import Data.Nat.show
open import Data.Equal.Type

-- Show tests
_ : show (Leaf) === "Leaf"
_ = refl

_ : show (Leaf {A = Nat}) === "Leaf"
_ = refl

_ : show (Node 2 (Node 1 Leaf Leaf) (Node 3 Leaf Leaf)) === "Node(2, Node(1, Leaf, Leaf), Node(3, Leaf, Leaf))"
_ = refl