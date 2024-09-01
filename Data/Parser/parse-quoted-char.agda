module Data.Parser.parse-quoted-char where

open import Data.Char.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.fail
open import Data.Parser.pure
open import Data.Parser.consume
open import Data.Parser.parse-char

-- Parses a quoted character: 'c' or '\n' etc.
parse-quoted-char : Parser Char
parse-quoted-char = do
  consume "'"
  c ← parse-char
  consume "'"
  pure c
