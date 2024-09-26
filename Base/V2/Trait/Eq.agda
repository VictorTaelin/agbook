module Base.V2.Trait.Eq where

open import Base.V2.V2
import Base.V2.eq as V2
import Base.V2.neq as V2
import Base.Trait.Eq as Eq

instance
  EqV2 : Eq.Eq V2 V2.eq
  EqV2 = Eq.make-eq V2.neq

