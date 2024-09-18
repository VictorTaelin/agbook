module Base.Char.to-nat where

open import Base.Char.Type
open import Base.Nat.Type

primitive
  primCharToNat : Char → Nat

to-nat : Char → Nat
to-nat = primCharToNat
