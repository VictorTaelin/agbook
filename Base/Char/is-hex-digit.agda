module Base.Char.is-hex-digit where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsHexDigit : Char → Bool

is-hex-digit : Char → Bool
is-hex-digit = primIsHexDigit
