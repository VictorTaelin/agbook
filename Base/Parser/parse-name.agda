module Base.Parser.parse-name where

import Base.Char.eq as Char
import Base.String.eq as String
open import Base.Bool.Type
open import Base.Bool.if
open import Base.Bool.or
open import Base.Char.Type
open import Base.Char.is-alpha
open import Base.Char.is-digit
open import Base.Function.case
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Type
open import Base.Parser.fail
open import Base.Parser.take-while
open import Base.String.Type
open import Base.String.append

-- Checks if a character is valid for a name (alphanumeric, underscore, hyphen, or dot)
is-name-char : Char -> Bool
is-name-char c = is-alpha c || is-digit c || (c Char.== '_') || (c Char.== '-') || (c Char.== '.')

-- Parses a name from the input.
-- A name consists of alphanumeric characters, underscores, hyphens, and dots.
parse-name : Parser String
parse-name = do
  name <- take-while is-name-char
  if name String.== ""
    then fail "Expected a name"
    else pure name
