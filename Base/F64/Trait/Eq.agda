module Base.F64.Trait.Eq where

open import Base.F64.F64
import Base.F64.eq as F64
import Base.F64.neq as F64
import Base.Trait.Eq as Eq

instance
  EqF64 : Eq.Eq F64
  EqF64 = Eq.make-eq F64.eq F64.neq