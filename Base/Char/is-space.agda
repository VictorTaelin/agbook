module Base.Char.is-space where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsSpace : Char -> Bool

is-space : Char -> Bool
is-space = primIsSpace
