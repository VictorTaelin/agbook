module Base.String.head where

open import Base.String.Type
open import Base.String.to-list
open import Base.Char.Type
open import Base.Maybe.Type
open import Base.List.Type

-- Returns the first character of a string, if it exists.
-- - 1st: The input string.
-- = A Maybe Char, containing the first character if the string is non-empty, or None if it's empty.
head : String -> Maybe Char
head s with to-list s
... | []       = None
... | (c :: _) = Some c