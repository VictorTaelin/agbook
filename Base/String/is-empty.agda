module Base.String.is-empty where

open import Base.Bool.Bool
open import Base.String.String
open import Base.List.List
open import Base.Char.Char
open import Base.String.to-list

-- Checks if a string is empty.
-- - 1st: The string to check.
-- = True if the string is empty, False otherwise.
is-empty : String -> Bool
is-empty s with to-list s
... | []       = True
... | (_ :: _) = False