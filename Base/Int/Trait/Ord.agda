module Base.Int.Trait.Ord where

open import Base.Trait.Ord
open import Base.Int.Type
import Base.Int.compare as Int
import Base.Int.lt as Int
import Base.Int.gt as Int
import Base.Int.lte as Int
import Base.Int.gte as Int

instance
  OrdInt : Ord Int
  OrdInt = record
    { compare = Int.compare
    ; lt = Int.lt
    ; gt = Int.gt
    ; lte = Int.lte
    ; gte = Int.gte
    }
