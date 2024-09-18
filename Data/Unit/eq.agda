module Data.Unit.eq where

open import Data.Unit.Type
open import Data.Trait.Eq public
open import Data.Bool.Type

instance
  EqUnit : Eq Unit
  EqUnit = record
    { eq  = λ _ _ → True
    ; neq = λ _ _ → False
    }
