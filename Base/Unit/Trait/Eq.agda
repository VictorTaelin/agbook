module Base.Unit.Trait.Eq where

open import Base.Unit.Type
import Base.Unit.eq as Unit
import Base.Unit.neq as Unit
import Base.Trait.Eq as Eq

instance
  EqUnit : Eq.Eq Unit
  EqUnit = record
    { eq = Unit.eq
    ; neq = Unit.neq
    }
