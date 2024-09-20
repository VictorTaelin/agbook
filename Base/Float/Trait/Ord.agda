module Base.Float.Trait.Ord where

open import Base.Float.Type
import Base.Float.lt as Float
import Base.Float.gt as Float
import Base.Float.lte as Float
import Base.Float.gte as Float
open import Base.Trait.Ord

instance
  OrdFloat : Ord Float
  OrdFloat = record
    { lt = Float.lt
    ; gt = Float.gt
    ; lte = Float.lte
    ; gte = Float.gte
    }
