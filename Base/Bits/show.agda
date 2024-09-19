module Base.Bits.show where

open import Base.Bits.Type
open import Base.String.Type
open import Base.String.append
open import Base.Show.Trait public

instance
  ShowBits : Show Bits
  ShowBits = record { to-string = show-bits }
    where
      show-bits : Bits → String
      show-bits E = "e"
      show-bits (O b) = "0" ++ show-bits b
      show-bits (I b) = "1" ++ show-bits b