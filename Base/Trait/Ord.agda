module Base.Trait.Ord where

open import Agda.Primitive
open import Base.Bool.Type
open import Base.Ordering.Type
open import Base.Ordering.eq
open import Base.Ordering.neq

record Ord {a} (A : Set a) : Set (lsuc a) where
  field
    compare : A → A → Ordering
    lt : A → A → Bool
    gt : A → A → Bool
    lte : A → A → Bool
    gte : A → A → Bool

open Ord {{...}} public

infix 4 _<_ _>_ _<=_ _>=_

_<_ : ∀ {a} {A : Set a} {{ordA : Ord A}} → A → A → Bool
_<_ {{ordA}} = lt {{ordA}}

_>_ : ∀ {a} {A : Set a} {{ordA : Ord A}} → A → A → Bool
_>_ {{ordA}} = gt {{ordA}}

_<=_ : ∀ {a} {A : Set a} {{ordA : Ord A}} → A → A → Bool
_<=_ {{ordA}} = lte {{ordA}}

_>=_ : ∀ {a} {A : Set a} {{ordA : Ord A}} → A → A → Bool
_>=_ {{ordA}} = gte {{ordA}}

default : ∀ {a} {A : Set a} → (A → A → Ordering) → Ord A
default compare-impl = record
  { compare = compare-impl
  ; lt = λ x y → compare-impl x y == LT
  ; gt = λ x y → compare-impl x y == GT
  ; lte = λ x y → compare-impl x y != GT
  ; gte = λ x y → compare-impl x y != LT
  }
