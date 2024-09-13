module Data.Trait.Ord where

open import Agda.Primitive
open import Data.Bool.Type
open import Data.Bool.eq
open import Data.Bool.or
open import Data.Equal.Type
open import Data.Comparison.Type
open import Data.Comparison.eq

open import Data.Bool.not

record Ord {a} (A : Set a) : Set (lsuc a) where
  infix 4 _<_ _>_ _<=_ _>=_
  field
    compare : A → A → Comparison
    _<_ _>_ _<=_ _>=_ : A → A → Bool

open Ord {{...}} public

default-ord : ∀ {A : Set} → (A → A → Comparison) → Ord A
default-ord cmp = record
  { compare = cmp
  ; _<_ = λ x y → cmp x y == LT
  ; _>_ = λ x y → cmp x y == GT
  ; _<=_ = λ x y → let c = cmp x y in (c == GT) || (c == EQ)
  ; _>=_ = λ x y → let c = cmp x y in (c == LT) || (c == EQ)
  }
