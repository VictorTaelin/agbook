module Base.V2.Trait.Eq where

open import Base.V2.V2
import Base.V2.eq as V2
import Base.V2.neq as V2
open import Base.Trait.Eq

instance
  EqV2 : Eq V2
  EqV2 = MkEq V2.eq V2.neq

