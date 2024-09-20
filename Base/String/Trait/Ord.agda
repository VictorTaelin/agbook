module Base.String.Trait.Ord where

open import Base.String.Type
import Base.String.lt as String
import Base.String.lte as String
import Base.String.gt as String
import Base.String.gte as String
import Base.String.compare as String
import Base.Trait.Ord as Ord

instance
  OrdString : Ord.Ord String
  OrdString = record
    { compare = String.compare
    ; lt = String.lt
    ; lte = String.lte
    ; gt = String.gt
    ; gte = String.gte
    }
