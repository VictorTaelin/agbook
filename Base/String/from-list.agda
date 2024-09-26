module Base.String.from-list where

open import Base.String.String
open import Base.Char.Char
open import Base.List.List

primitive primStringFromList : List Char -> String

-- Converts a list of characters to a string.
-- - 1st: The input list of characters.
-- = A string composed of the characters in the list.
from-list : List Char -> String
from-list = primStringFromList
