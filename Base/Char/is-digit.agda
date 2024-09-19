module Base.Char.is-digit where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsDigit : Char → Bool

is-digit : Char → Bool
is-digit = primIsDigit
