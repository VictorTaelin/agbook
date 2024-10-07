module Base.Char.show where

open import Base.Char.Char
open import Base.String.String
open import Base.String.append
open import Base.String.from-char

-- Converts a character to its string representation.
-- 1st: The input character.
-- = A string containing the character enclosed in single quotes.
show : Char → String
show c = "'" ++ from-char c ++ "'"