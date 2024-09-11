module Data.JSON.parse-null where

open import Data.JSON.Type
open import Data.Parser.bind
open import Data.Parser.Type
open import Data.Parser.consume
open import Data.Parser.pure
open import Data.Parser.skip-spaces

-- Parses a JSON null value.
-- Skips any leading whitespace, consumes the "null" string,
-- and returns a JNull JSON value.
parse-null : Parser JSON
parse-null = do
  skip-spaces
  consume "null"
  pure JNull
