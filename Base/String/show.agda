module Base.String.show where

open import Base.String.String

primitive primShowString : String -> String

-- Converts a string to its string representation.
-- - 1st: The input string.
-- = A new string that represents the input string, typically with added quotation marks.
show : String -> String
show = primShowString
