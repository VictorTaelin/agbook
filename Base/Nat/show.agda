module Base.Nat.show where

open import Base.Nat.Type
open import Base.String.Type
open import Base.Trait.Show public

primitive
  primShowNat : Nat → String

instance
  ShowNat : Show Nat
  ShowNat = record { to-string = show-nat }
    where
      show-nat : Nat → String
      show-nat = primShowNat
