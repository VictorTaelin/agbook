module Base.Bits.Trait.Ord where

open import Base.Bits.Type
import Base.Bits.lt as Bits
import Base.Bits.gt as Bits
open import Base.Trait.Ord

instance
  OrdBits : Ord Bits
  OrdBits = record
    { lt = Bits.lt
    ; gt = Bits.gt
    }
