module Data.String.show where

open import Data.String.Type

primitive
  primShowString : String → String

-- Converts a string to a string representation.
-- - s: The input string.
-- = A string representation of the input string.
show : String → String
show = primShowString
