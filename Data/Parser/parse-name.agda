module Data.Parser.parse-name where

open import Data.Bool.Type
open import Data.Bool.or
open import Data.Bool.if
open import Data.Char.Type
open import Data.Char.is-alpha
open import Data.Char.is-digit
import Data.Char.eq as CharEq
import Data.String.eq as StringEq
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
is-name-char c = is-alpha c || is-digit c || (CharEq._==_ c '_') || (CharEq._==_ c '-') || (CharEq._==_ c '.')

-- Parses a name from the input.
-- A name consists of alphanumeric characters, underscores, hyphens, and dots.
parse-name : Parser String
parse-name = do
  name ← take-while is-name-char
  if StringEq._==_ name ""
    then fail "Expected a name"
    else pure name
