module Data.Parser.Error where

open import Data.Nat.Type
open import Data.String.Type

-- Represents a parser error with an index and an error message.
-- - index: The position in the input where the error occurred.
-- - error: A string describing the error.
record Error : Set where
  constructor MkError
  field
    index : Nat
    error : String
