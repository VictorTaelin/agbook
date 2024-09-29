module Base.Unit.Trait.Eq where

open import Base.Unit.Unit
import Base.Unit.eq as Unit
import Base.Unit.neq as Unit
open import Base.Trait.Eq

instance
  EqUnit : Eq Unit
  EqUnit = MkEq Unit.eq Unit.neq
