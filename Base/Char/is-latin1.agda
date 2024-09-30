module Base.Char.is-latin1 where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsLatin1 : Char → Bool

is-latin1 : Char → Bool
is-latin1 = primIsLatin1
