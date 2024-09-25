module Base.String.from-char where

open import Base.Char.Type
open import Base.List.Type
open import Base.String.Type
open import Base.String.from-list

-- Converts a character to a string.
-- - 1st: The input character.
-- = A string containing only the input character.
from-char : Char -> String
from-char c = from-list (c :: [])