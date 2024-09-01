module Data.Char.is-lower where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsLower : Char → Bool

is-lower : Char → Bool
is-lower = primIsLower
