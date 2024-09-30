module Base.Char.is-lower where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsLower : Char → Bool

is-lower : Char → Bool
is-lower = primIsLower
