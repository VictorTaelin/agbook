module Data.Tree.count where

open import Data.Tree.Type
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Class.Eq

count : ∀ {A : Set} {{EqA : Eq A}} → A → Tree A → Nat
count _ Leaf = Zero
count x (Node y l r) = (if x == y then 1 else 0) + (count x l + count x r)