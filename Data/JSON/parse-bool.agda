module Data.JSON.parse-bool where

open import Data.JSON.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.consume
open import Data.Parser.pure
open import Data.Parser.skip-spaces
open import Data.Parser.alternative
open import Data.Bool.Type

-- Parses a JSON boolean value.
-- - Skips any leading whitespace.
-- - Consumes either "true" or "false" string.
-- - Returns a JBool JSON value.
parse-bool : Parser JSON
parse-bool = do
  skip-spaces
  b ← (consume "true" >> pure True) <|> (consume "false" >> pure False)
  pure (JBool b)
