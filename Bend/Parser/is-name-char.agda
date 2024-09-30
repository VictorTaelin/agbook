module Bend.Parser.is-name-char where

open import Base.Char.Char
open import Base.Bool.Bool
open import Base.Bool.or
open import Base.Char.eq
open import Base.Char.is-alpha
open import Base.Char.is-digit

-- Checks if a character is valid for a Bend name.
-- - c: The character to check.
-- = True if the character is valid for a name, False otherwise.
is-name-char : Char → Bool
is-name-char c =
  (is-alpha c) || (is-digit c) ||
  (c == '_') || (c == '.') || (c == '-') || (c == '/')
