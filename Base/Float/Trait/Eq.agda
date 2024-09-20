module Base.Float.Trait.Eq where

open import Base.Float.Type
import Base.Float.eq as Float
import Base.Float.neq as Float
open import Base.Trait.Eq

instance
  EqFloat : Eq Float
  EqFloat = record
    { eq = Float.eq
    ; neq = Float.neq
    }
