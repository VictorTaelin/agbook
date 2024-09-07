module Data.JSON.parse-array where

open import Data.JSON.Type
open import Data.List.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.consume
open import Data.Parser.pure
open import Data.Parser.skip-spaces
open import Data.Parser.alternative

-- Parses a JSON array.
-- - Skips leading whitespace.
-- - Consumes opening bracket "[".
-- - Parses elements (which can be any JSON value).
-- - Consumes closing bracket "]".
-- - Returns a JArray JSON value.
parse-array : Parser JSON → Parser JSON
parse-array parseJSON = do
  skip-spaces
  consume "["
  elements ← parse-elements
  skip-spaces
  consume "]"
  pure (JArray elements)
  where
    parse-elements : Parser (List JSON)
    parse-elements = parseJSON >>= λ first →
      (do
        skip-spaces
        consume ","
        rest ← parse-elements
        pure (first :: rest))
      <|> pure (first :: [])
      <|> pure []