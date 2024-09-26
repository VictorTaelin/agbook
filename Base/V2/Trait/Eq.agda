module Base.V2.Trait.Eq where

import Base.V2.eq as V2
import Base.V2.neq as V2
open import Base.Trait.Eq
open import Base.V2.V2

instance
  EqV2 : Eq V2
  EqV2 = record
    { eq = V2.eq
    ; neq = V2.neq
    }

