module Base.Char.is-print where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsPrint : Char -> Bool

is-print : Char -> Bool
is-print = primIsPrint
