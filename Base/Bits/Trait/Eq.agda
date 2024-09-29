module Base.Bits.Trait.Eq where

open import Base.Bits.Bits
import Base.Bits.eq as Bits
import Base.Bits.neq as Bits
open import Base.Trait.Eq

instance
  EqBits : Eq Bits
  EqBits = MkEq Bits.eq Bits.neq
