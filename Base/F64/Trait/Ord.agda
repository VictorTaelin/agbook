module Base.F64.Trait.Ord where

open import Base.F64.F64
import Base.F64.compare as F64
import Base.F64.lt as F64
import Base.F64.gt as F64
import Base.F64.lte as F64
import Base.F64.gte as F64
open import Base.Trait.Ord

instance
  OrdF64 : Ord F64
  OrdF64 = record
    { compare = F64.compare
    ; lt = F64.lt
    ; gt = F64.gt
    ; lte = F64.lte
    ; gte = F64.gte
    }
