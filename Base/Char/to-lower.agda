module Base.Char.to-lower where

open import Base.Char.Char

primitive primToLower : Char → Char

-- Converts a character to its lowercase equivalent.
-- 1st: The input character.
-- = The lowercase version of the input character.
to-lower : Char → Char
to-lower = primToLower