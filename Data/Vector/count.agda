module Data.Vector.count where

open import Data.Vector.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Trait.Eq

count : ∀ {A : Set} {n : Nat} {{EqA : Eq A}} → A → Vector A n → Nat
count _ [] = Zero
count x (y :: ys) = (if x == y then 1 else 0) + count x ys