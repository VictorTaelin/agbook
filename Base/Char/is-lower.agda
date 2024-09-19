module Base.Char.is-lower where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsLower : Char → Bool

is-lower : Char → Bool
is-lower = primIsLower
