module Base.U64.Trait.Eq where

open import Base.U64.U64
import Base.U64.eq as U64
import Base.U64.neq as U64
import Base.Trait.Eq as Eq

instance
  EqU64 : Eq.Eq U64
  EqU64 = record
    { eq = U64.eq
    ; neq = U64.neq
    }
