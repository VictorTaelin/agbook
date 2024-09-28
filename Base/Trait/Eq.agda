module Base.Trait.Eq where

open import Agda.Primitive
open import Base.Bool.Bool
open import Base.Bool.not

record Eq {a} (A : Set a) : Set (lsuc a) where
  constructor MkEq
  field
    eq  : A → A → Bool
    neq : A → A → Bool

  _==_ = eq
  _!=_ = neq

  infix 4 _==_ _!=_

open Eq {{...}} public

derive-eq : ∀ {a} {A : Set a} → (A → A → Bool) → Eq A
derive-eq eq = MkEq eq (λ x y → ! (eq x y))
