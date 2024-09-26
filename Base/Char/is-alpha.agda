module Base.Char.is-alpha where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsAlpha : Char -> Bool

is-alpha : Char -> Bool
is-alpha = primIsAlpha
