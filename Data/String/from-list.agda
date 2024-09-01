module Data.String.from-list where

open import Data.String.Type
open import Data.Char.Type
open import Data.List.Type

primitive
  primStringFromList : List Char → String

-- Converts a list of characters to a string.
-- - cs: The input list of characters.
-- = A string composed of the characters in the list.
from-list : List Char → String
from-list = primStringFromList
