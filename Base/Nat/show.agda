module Base.Nat.show where

open import Base.Nat.Type
open import Base.String.Type

show : Nat → String
show = primShowNat
