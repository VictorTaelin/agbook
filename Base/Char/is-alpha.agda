module Base.Char.is-alpha where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsAlpha : Char -> Bool

is-alpha : Char -> Bool
is-alpha = primIsAlpha
