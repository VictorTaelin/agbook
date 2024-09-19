module Base.JSON.parse-null where

open import Base.JSON.Type
open import Base.Parser.bind
open import Base.Parser.Type
open import Base.Parser.consume
open import Base.Parser.pure
open import Base.Parser.skip-spaces

-- Parses a JSON null value.
-- Skips any leading whitespace, consumes the "null" string,
-- and returns a JNull JSON value.
parse-null : Parser JSON
parse-null = do
  skip-spaces
  consume "null"
  pure JNull
