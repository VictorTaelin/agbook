module Data.Bits.show where

open import Data.Bits.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show

instance
  ShowBits : Show Bits
  ShowBits = record { to-string = show-bits }
    where
      show-bits : Bits → String
      show-bits E = "e"
      show-bits (O b) = "0" ++ show-bits b
      show-bits (I b) = "1" ++ show-bits b