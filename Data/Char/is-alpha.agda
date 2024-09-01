module Data.Char.is-alpha where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsAlpha : Char → Bool

is-alpha : Char → Bool
is-alpha = primIsAlpha
