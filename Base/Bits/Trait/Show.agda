module Base.Bits.Trait.Show where

open import Base.Bits.Bits
import Base.Bits.show as Bits
open import Base.Trait.Show

instance
  ShowBits : Show Bits
  ShowBits = record { to-string = Bits.show }
