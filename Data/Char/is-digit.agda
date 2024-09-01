module Data.Char.is-digit where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsDigit : Char → Bool

is-digit : Char → Bool
is-digit = primIsDigit
