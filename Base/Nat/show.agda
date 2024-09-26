module Base.Nat.show where

open import Base.Nat.Nat
open import Base.String.String

primitive
  primShowNat : Nat -> String

show : Nat -> String
show = primShowNat
