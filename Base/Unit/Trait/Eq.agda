module Base.Unit.Trait.Eq where

open import Base.Unit.Unit
import Base.Unit.eq as Unit
import Base.Unit.neq as Unit
import Base.Trait.Eq as Eq

instance
  EqUnit : Eq.Eq Unit
  EqUnit = Eq.make-eq Unit.eq Unit.neq 