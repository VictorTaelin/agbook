module Bend.Parser.is-name-char where

open import Data.Char.Type
open import Data.Bool.Type
open import Data.Bool.or
open import Data.Char.eq
open import Data.Char.is-alpha
open import Data.Char.is-digit

-- Checks if a character is valid for a Bend name.
-- - c: The character to check.
-- = True if the character is valid for a name, False otherwise.
is-name-char : Char → Bool
is-name-char c =
  (is-alpha c) || (is-digit c) ||
  (c == '_') || (c == '.') || (c == '-') || (c == '/')
