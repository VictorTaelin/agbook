module Data.Char.is-print where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsPrint : Char → Bool

is-print : Char → Bool
is-print = primIsPrint
