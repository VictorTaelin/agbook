module Base.U64.Trait.Eq where

open import Base.U64.U64
import Base.U64.eq as U64
import Base.U64.neq as U64
open import Base.Trait.Eq

instance
  EqU64 : Eq U64
  EqU64 = MkEq U64.eq U64.neq

