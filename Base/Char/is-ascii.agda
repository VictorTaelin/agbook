module Base.Char.is-ascii where

open import Base.Char.Char
open import Base.Bool.Bool

primitive
  primIsAscii : Char → Bool

is-ascii : Char → Bool
is-ascii = primIsAscii
