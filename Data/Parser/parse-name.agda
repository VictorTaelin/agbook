module Data.Parser.parse-name where

open import Data.Bool.Type
open import Data.Bool.or
open import Data.Bool.if
open import Data.Char.Type
open import Data.Char.is-alpha
open import Data.Char.is-digit
open import Data.Char.eq
open import Data.String.eq
open import Data.Parser.Type
open import Data.Parser.take-while
open import Data.Parser.bind
open import Data.Parser.fail
open import Data.Parser.pure
open import Data.String.Type
open import Data.String.append
open import Data.Function.case

-- Checks if a character is valid for a name (alphanumeric, underscore, hyphen, or dot)
is-name-char : Char → Bool
is-name-char c = is-alpha c || is-digit c || (c == '_') || (c == '-') || (c == '.')

-- Parses a name from the input.
-- A name consists of alphanumeric characters, underscores, hyphens, and dots.
parse-name : Parser String
parse-name = do
  name ← take-while is-name-char
  if name == ""
    then fail "Expected a name"
    else pure name
