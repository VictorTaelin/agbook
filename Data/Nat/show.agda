module Data.Nat.show where

open import Data.Nat.Type
open import Data.String.Type
open import Data.Trait.Show
open import Data.Equal.Type
open import Data.Nat.div
open import Data.Nat.mod
open import Data.String.append

instance
  ShowNat : Show Nat
  ShowNat = record { toString = showNat }
    where
      showDigit : Nat → String
      showDigit 0 = "0"
      showDigit 1 = "1"
      showDigit 2 = "2"
      showDigit 3 = "3"
      showDigit 4 = "4"
      showDigit 5 = "5"
      showDigit 6 = "6"
      showDigit 7 = "7"
      showDigit 8 = "8"
      showDigit 9 = "9"
      showDigit _ = ""

      showNatHelper : Nat → String → String
      showNatHelper Zero acc = acc
      showNatHelper n    acc =
        let digit = n % 10
            rest  = div n 10
        in showNatHelper rest (showDigit digit ++ acc)

      showNat : Nat → String
      showNat Zero = "0"
      showNat n    = showNatHelper n ""

-- Testes
_ : show 0 === "0"
_ = refl

_ : show 5 === "5"
_ = refl

_ : show 10 === "10"
_ = refl