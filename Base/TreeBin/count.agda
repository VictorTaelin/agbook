module Base.TreeBin.count where

open import Base.Bool.if
open import Base.Bool.Type
open import Base.Nat.add
open import Base.Nat.Type
open import Base.Trait.Eq
open import Base.TreeBin.Type

count : ∀ {A : Set} {{EqA : Eq A}} → A → TreeBin A → Nat
count _ Leaf         = Zero
count x (Node y l r) = (if x == y then 1 else 0) + (count x l + count x r)
