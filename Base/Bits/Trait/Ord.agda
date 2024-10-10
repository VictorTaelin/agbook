module Base.Bits.Trait.Ord where

open import Base.Bits.Bits
import Base.Bits.compare as Bits
import Base.Bits.lt as Bits
import Base.Bits.gt as Bits
import Base.Bits.lte as Bits
import Base.Bits.gte as Bits
open import Base.Trait.Ord

instance
  OrdBits : Ord Bits
  OrdBits = record
    { compare = Bits.compare
    ; lt = Bits.lt
    ; gt = Bits.gt
    ; lte = Bits.lte
    ; gte = Bits.gte
    }

