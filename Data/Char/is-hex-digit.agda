module Data.Char.is-hex-digit where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsHexDigit : Char → Bool

is-hex-digit : Char → Bool
is-hex-digit = primIsHexDigit
