module Base.Char.is-space where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsSpace : Char → Bool

is-space : Char → Bool
is-space = primIsSpace
