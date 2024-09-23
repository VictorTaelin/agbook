module Base.Int.Trait.Eq where

open import Base.Int.Type
import Base.Int.eq as Int
import Base.Int.neq as Int
import Base.Trait.Eq as Eq

instance
  EqInt : Eq.Eq Int
  EqInt = record
    { eq = Int.eq
    ; neq = Int.neq
    }
