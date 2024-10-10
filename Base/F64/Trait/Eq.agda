module Base.F64.Trait.Eq where

open import Base.F64.F64
import Base.F64.eq as F64
import Base.F64.neq as F64
open import Base.Trait.Eq

instance
  EqF64 : Eq F64
  EqF64 = MkEq F64.eq F64.neq

