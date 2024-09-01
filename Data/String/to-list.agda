module Data.String.to-list where

open import Data.String.Type
open import Data.Char.Type
open import Data.List.Type

primitive
  primStringToList : String → List Char

-- Converts a string to a list of characters.
-- - s: The input string.
-- = A list of characters representing the string.
to-list : String → List Char
to-list = primStringToList
