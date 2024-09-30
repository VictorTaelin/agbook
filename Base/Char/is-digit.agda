module Base.Char.is-digit where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsDigit : Char → Bool

is-digit : Char → Bool
is-digit = primIsDigit
