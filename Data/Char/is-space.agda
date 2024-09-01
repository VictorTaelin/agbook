module Data.Char.is-space where

open import Data.Char.Type
open import Data.Bool.Type

primitive
  primIsSpace : Char → Bool

is-space : Char → Bool
is-space = primIsSpace
