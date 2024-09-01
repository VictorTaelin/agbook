module Data.Char.to-upper where

open import Data.Char.Type

primitive
  primToUpper : Char → Char

to-upper : Char → Char
to-upper = primToUpper
