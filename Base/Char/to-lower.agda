module Base.Char.to-lower where

open import Base.Char.Char

primitive
  primToLower : Char -> Char

to-lower : Char -> Char
to-lower = primToLower
