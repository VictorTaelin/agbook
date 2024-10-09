module Base.List.count where

open import Base.List.List
open import Base.Equal.Equal
open import Base.Bool.if
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Trait.Eq

count : ∀ {A : Set} {{eqA : Eq A}} → A → List A → Nat
count _ []        = Zero
count x (y :: ys) = (if x == y then 1 else 0) + count x ys

