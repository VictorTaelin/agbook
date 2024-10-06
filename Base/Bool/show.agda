module Base.Bool.show where

open import Base.Bool.Bool
open import Base.String.String

-- Converts a boolean value to its string representation.
-- - 1st: The boolean value to convert.
-- = "true" if 1st is True, "false" if 1st is False.
show : Bool → String
show True  = "true"
show False = "false"
