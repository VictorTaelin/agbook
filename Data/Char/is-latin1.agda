module Data.Char.is-latin1 where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsLatin1 : Char → Bool

is-latin1 : Char → Bool
is-latin1 = primIsLatin1
