module Base.Char.to-lower where

open import Base.Char.Type

primitive primToLower : Char → Char

to-lower : Char → Char
to-lower = primToLower
