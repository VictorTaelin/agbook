module Base.Parser.parse-name where

open import Base.Bool.Type
open import Base.Bool.or
open import Base.Bool.if
open import Base.Char.Type
open import Base.Char.is-alpha
open import Base.Char.is-digit
open import Base.Char.eq
open import Base.String.eq
open import Base.Parser.Type
open import Base.Parser.take-while
open import Base.Parser.bind
open import Base.Parser.fail
open import Base.Parser.pure
open import Base.String.Type
open import Base.String.append
open import Base.Function.case

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
