module Base.Tree.count where

open import Base.Tree.Type
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Eq.Trait

count : ∀ {A : Set} {{EqA : Eq A}} → A → Tree A → Nat
count _ Leaf = Zero
count x (Node y l r) = (if x == y then 1 else 0) + (count x l + count x r)