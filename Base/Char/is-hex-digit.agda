module Base.Char.is-hex-digit where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsHexDigit : Char -> Bool

is-hex-digit : Char -> Bool
is-hex-digit = primIsHexDigit
