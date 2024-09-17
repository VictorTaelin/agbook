module Data.Trait.Eq.default-eq where

open import Data.Trait.Eq
open import Data.Bool.Type
open import Data.Bool.not

default-eq : ∀ {A : Set} → (A → A → Bool) → Eq A
default-eq _==_ = record
  { eq  = _==_
  ; neq = λ x y → not (x == y)
  }
