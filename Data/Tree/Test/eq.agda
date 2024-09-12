module Data.Tree.Trait.eq where

open import Data.Tree.Type
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Equal.Type

-- Testes
_ : ((Node 1 Leaf Leaf) == (Node 1 Leaf Leaf)) === True
_ = refl

_ : (Node 1 (Node 2 Leaf Leaf) Leaf != Node 1 (Node 2 Leaf Leaf) Leaf) === False
_ = refl

_ : ((Node 1 Leaf Leaf) == Node 2 Leaf Leaf) === False
_ = refl

_ : (Leaf != (Node 1 Leaf Leaf)) === True
_ = refl
