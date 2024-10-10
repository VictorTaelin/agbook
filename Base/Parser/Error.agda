module Base.Parser.Error where

open import Base.Nat.Nat
open import Base.String.String

-- Represents a parser error with an index and an error message.
-- - 1st: The position in the input where the error occurred.
-- - 2nd: A string describing the error.
-- = A record containing the error information.
record Error : Set where
  constructor MkError
  field
    index : Nat
    error : String

