module Data.Char.is-ascii where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsAscii : Char → Bool

is-ascii : Char → Bool
is-ascii = primIsAscii
