module Data.Char.to-nat where

open import Data.Char.Type
open import Data.Nat.Type

primitive
  primCharToNat : Char → Nat

to-nat : Char → Nat
to-nat = primCharToNat
