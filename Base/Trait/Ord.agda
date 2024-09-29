module Base.Trait.Ord where

open import Agda.Primitive
open import Base.Bool.Bool
open import Base.Ordering.Ordering
open import Base.Ordering.eq
open import Base.Ordering.neq

record Ord {a} (A : Set a) : Set (lsuc a) where
  constructor MkOrd
  field
    compare : A → A → Ordering
    lt      : A → A → Bool
    gt      : A → A → Bool
    lte     : A → A → Bool
    gte     : A → A → Bool

  _<_  = lt
  _>_  = gt
  _<=_ = lte
  _>=_ = gte

  infix 4 _<_ _>_ _<=_ _>=_

open Ord {{...}} public

derive-ord : ∀ {a} {A : Set a} → (A → A → Ordering) → Ord A
derive-ord compare = MkOrd compare
  (λ x y → compare x y == LT)
  (λ x y → compare x y == GT)
  (λ x y → compare x y != GT)
  (λ x y → compare x y != LT)
