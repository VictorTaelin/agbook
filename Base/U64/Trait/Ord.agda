module Base.U64.Trait.Ord where

open import Base.U64.Type
import Base.U64.lt as U64
import Base.U64.lte as U64
import Base.U64.gt as U64
import Base.U64.gte as U64
import Base.Trait.Ord as Ord

instance
  OrdU64 : Ord.Ord U64
  OrdU64 = record
    { lt = U64.lt
    ; lte = U64.lte
    ; gt = U64.gt
    ; gte = U64.gte
    }
