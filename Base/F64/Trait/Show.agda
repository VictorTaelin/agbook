module Base.F64.Trait.Show where

open import Base.F64.F64
import Base.F64.show as F64
open import Base.Trait.Show

instance
  ShowF64 : Show F64
  ShowF64 = record { to-string = F64.show }

