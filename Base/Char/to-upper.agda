module Base.Char.to-upper where

open import Base.Char.Char

primitive primToUpper : Char → Char

-- Converts a character to its uppercase equivalent.
-- 1st: The character to convert.
-- = The uppercase version of the input character.
to-upper : Char → Char
to-upper = primToUpper

