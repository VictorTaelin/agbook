module Data.Char.to-lower where

open import Data.Char.Type

primitive
  primToLower : Char → Char

to-lower : Char → Char
to-lower = primToLower
