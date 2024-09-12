module Data.Nat.show where

open import Data.Nat.Type
open import Data.String.Type
open import Data.Trait.Show public
open import Data.Nat.div
open import Data.Nat.mod
open import Data.String.append

instance
  ShowNat : Show Nat
  ShowNat = record { to-string = show-nat }
    where
      show-digit : Nat → String
      show-digit 0 = "0"
      show-digit 1 = "1"
      show-digit 2 = "2"
      show-digit 3 = "3"
      show-digit 4 = "4"
      show-digit 5 = "5"
      show-digit 6 = "6"
      show-digit 7 = "7"
      show-digit 8 = "8"
      show-digit 9 = "9"
      show-digit _ = ""

      show-helper : Nat → String → String
      show-helper Zero acc = acc
      show-helper n    acc =
        let digit = n % 10
            rest  = div n 10
        in show-helper rest (show-digit digit ++ acc)

      show-nat : Nat → String
      show-nat Zero = "0"
      show-nat n    = show-helper n ""
