module Base.Char.is-latin1 where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsLatin1 : Char → Bool

is-latin1 : Char → Bool
is-latin1 = primIsLatin1
