module Base.Char.to-lower where

open import Base.Char.Char

primitive
  primToLower : Char → Char

-- Converts a character to its lowercase equivalent.
-- This function transforms an uppercase character to lowercase.
-- If the character is already lowercase or not a letter, it remains unchanged.
-- 1st: The input character.
-- = The lowercase version of the input character.
to-lower : Char → Char
to-lower = primToLower