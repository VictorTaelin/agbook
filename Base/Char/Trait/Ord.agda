module Base.Char.Trait.Ord where

open import Base.Char.Type
import Base.Char.compare as Char
import Base.Char.lt as Char
import Base.Char.gt as Char
import Base.Char.lte as Char
import Base.Char.gte as Char
open import Base.Trait.Ord

instance
  OrdChar : Ord Char
  OrdChar = record
    { compare = Char.compare
    ; lt = Char.lt
    ; gt = Char.gt
    ; lte = Char.lte
    ; gte = Char.gte
    }
