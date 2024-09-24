module Base.BinTree.count where

open import Base.BinTree.Type
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Trait.Eq

count : ∀ {A : Set} {{EqA : Eq A}} -> A -> BinTree A -> Nat
count _ Leaf         = Zero
count x (Node y l r) = (if x == y then 1 else 0) + (count x l + count x r)
