module Base.Char.is-print where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsPrint : Char → Bool

is-print : Char → Bool
is-print = primIsPrint
