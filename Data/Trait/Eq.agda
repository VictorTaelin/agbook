module Data.Trait.Eq where

open import Agda.Primitive
open import Data.Bool.Type

record Eq {a} (A : Set a) : Set (lsuc a) where
  field
    _≡_ : A → A → Bool
    _≠_ : A → A → Bool

open Eq {{...}} public

infix 4 _==_ _!=_

_==_ : ∀ {a} {A : Set a} {{eqA : Eq A}} → A → A → Bool
_==_ {{eqA}} = _≡_ {{eqA}}

_!=_ : ∀ {a} {A : Set a} {{eqA : Eq A}} → A → A → Bool
_!=_ {{eqA}} = _≠_ {{eqA}}
