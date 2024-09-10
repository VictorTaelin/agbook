module Data.List.count where

open import Data.List.Type

open import Data.Class.Eq
open import Data.Equal.Type
open import Data.Bool.if
open import Data.Nat.Type
open import Data.Nat.add

-- Função que usa a nova implementação de igualdade
count : ∀ {A : Set} {{eqA : Eq A}} → A → List A → Nat
count _ [] = Zero
count x (y :: ys) = (if x == y then 1 else 0) + count x ys
