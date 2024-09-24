module Base.String.to-list where

open import Base.String.Type
open import Base.Char.Type
open import Base.List.Type

primitive primStringToList : String -> List Char

-- Converts a string to a list of characters.
-- - s: The input string.
-- = A list of characters representing the string.
to-list : String -> List Char
to-list = primStringToList
