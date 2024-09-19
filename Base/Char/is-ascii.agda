module Base.Char.is-ascii where

open import Base.Char.Type
open import Base.Bool.Type

primitive
  primIsAscii : Char → Bool

is-ascii : Char → Bool
is-ascii = primIsAscii
