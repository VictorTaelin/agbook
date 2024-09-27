module Base.Bits.Trait.Eq where

open import Base.Bits.Bits
import Base.Bits.eq as Bits
import Base.Bits.neq as Bits
import Base.Trait.Eq as Eq

instance
  EqBits : Eq.Eq Bits
  EqBits = Eq.make-eq Bits.eq Bits.neq