module Base.Unit.eq where

open import Base.Unit.Type
open import Base.Eq.Trait public
open import Base.Bool.Type

instance
  EqUnit : Eq Unit
  EqUnit = record
    { eq  = λ _ _ → True
    ; neq = λ _ _ → False
    }
