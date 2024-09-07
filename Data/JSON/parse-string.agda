module Data.JSON.parse-string where

open import Data.JSON.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.skip-spaces
open import Data.Parser.parse-string renaming (parse-string to parse-pstring)

-- Parses a JSON string value.
-- - Skips any leading whitespace.
-- - Parses a quoted string.
-- - Returns a JString JSON value.
parse-string : Parser JSON
parse-string = do
  skip-spaces
  str ← parse-pstring
  pure (JString str)
