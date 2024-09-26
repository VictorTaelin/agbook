module Base.Char.to-nat where

open import Base.Char.Char
open import Base.Nat.Nat

primitive
  primCharToNat : Char -> Nat

to-nat : Char -> Nat
to-nat = primCharToNat
