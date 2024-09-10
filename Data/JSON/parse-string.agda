module Data.JSON.parse-string where

open import Data.JSON.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.pure
open import Data.Parser.skip-spaces
open import Data.Parser.consume
open import Data.Parser.fail
open import Data.Parser.parse-char
open import Data.Parser.alternative
open import Data.Char.Type
open import Data.Char.eq
open import Data.String.Type
open import Data.String.from-list
open import Data.List.Type
open import Data.Bool.Type
open import Data.Bool.if
open import Data.Bool.or
open import Data.Function.case

-- Parses an escape sequence
parse-escape : Parser Char
parse-escape = do
  consume "\\"
  (parse-char >>= λ where
    '"'  → pure '"'
    '\\' → pure '\\'
    '/'  → pure '/'
    'b'  → pure '\b'
    'f'  → pure '\f'
    'n'  → pure '\n'
    'r'  → pure '\r'
    't'  → pure '\t'
    'u'  → fail "Unicode escape sequences are not supported"
    _    → fail "Invalid escape sequence")

-- Parses a single character in a JSON string
parse-string-char : Parser Char
parse-string-char =
  parse-escape <|> do
    c ← parse-char
    if (c == '"') || (c == '\\')
      then fail "Unexpected '\"' or '\\'"
      else pure c

-- Parses the contents of a JSON string
parse-string-contents : Parser (List Char)
parse-string-contents =
  (parse-string-char >>= λ c →
   parse-string-contents >>= λ cs →
   pure (c :: cs))
  <|> pure []

-- Parses a JSON string and returns the String value
parse-string-value : Parser String
parse-string-value = do
  skip-spaces
  consume "\""
  chars ← parse-string-contents
  consume "\""
  pure (from-list chars)

-- Parses a JSON string and returns a JSON value
parse-string : Parser JSON
parse-string = do
  str ← parse-string-value
  pure (JString str)
