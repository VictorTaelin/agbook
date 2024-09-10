module Data.Bits.show where

open import Data.Bits.Type
open import Data.String.Type
open import Data.String.append
open import Data.Trait.Show

instance
  ShowBits : Show Bits
  ShowBits = record { toString = showBits }
    where
      showBits : Bits → String
      showBits E = "e"
      showBits (O b) = "0" ++ showBits b
      showBits (I b) = "1" ++ showBits b

-- Tests
open import Data.Equal.Type

_ : show (I (O (I E))) === "101e"
_ = refl

_ : show (E) === "e"
_ = refl