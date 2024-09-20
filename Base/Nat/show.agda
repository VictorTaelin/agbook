module Base.Nat.show where

open import Base.Nat.Type
open import Base.String.Type

primitive
  primShowNat : Nat → String

show : Nat → String
show = primShowNat
