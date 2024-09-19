module Base.Nat.show where

open import Base.Nat.Type
open import Base.String.Type
open import Base.Show.Trait public

instance
  ShowNat : Show Nat
  ShowNat = record { to-string = show-nat }
    where
      show-nat : Nat → String
      show-nat = primShowNat
