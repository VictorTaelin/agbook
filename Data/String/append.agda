module Data.String.append where

open import Data.String.Type

primitive
  primStringAppend : String → String → String

-- Concatenates two strings.
-- - s1: The first string.
-- - s2: The second string.
-- = The concatenation of s1 and s2.
append : String → String → String
append = primStringAppend

_++_ : String → String → String
_++_ = append

infixr 5 _++_
