module Base.Char.to-upper where

open import Base.Char.Type

primitive
  primToUpper : Char → Char

to-upper : Char → Char
to-upper = primToUpper
