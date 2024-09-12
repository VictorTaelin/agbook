module Data.Nat.show where

open import Data.Nat.Type
open import Data.String.Type
open import Data.Trait.Show public

instance
  ShowNat : Show Nat
  ShowNat = record { to-string = show-nat }
    where
      show-nat : Nat → String
      show-nat = primShowNat
