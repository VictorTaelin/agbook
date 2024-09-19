module Base.Trait.Eq where

open import Agda.Primitive
open import Base.Bool.Type

record Eq {a} (A : Set a) : Set (lsuc a) where
  field
    eq : A → A → Bool
    neq : A → A → Bool

open Eq {{...}} public

infix 4 _==_ _!=_

_==_ : ∀ {a} {A : Set a} {{eqA : Eq A}} → A → A → Bool
_==_ {{eqA}} = eq {{eqA}}

_!=_ : ∀ {a} {A : Set a} {{eqA : Eq A}} → A → A → Bool
_!=_ {{eqA}} = neq {{eqA}}
