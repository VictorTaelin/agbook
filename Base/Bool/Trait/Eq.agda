module Base.Bool.Trait.Eq where

open import Base.Bool.Type
import Base.Bool.eq as Bool
import Base.Bool.neq as Bool
open import Base.Trait.Eq

instance
  EqBool : Eq Bool
  EqBool = record
    { eq = Bool.eq
    ; neq = Bool.neq
    }
