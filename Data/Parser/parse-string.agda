{-# OPTIONS --no-termination-check #-}
module Data.Parser.parse-string where

open import Data.Char.Type
open import Data.Function.case
open import Data.List.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.consume
open import Data.Parser.fail
open import Data.Parser.parse-char
open import Data.Parser.pure
open import Data.String.Type
open import Data.String.from-list

-- Helper function to parse multiple characters
parse-chars : Parser (List Char)
parse-chars = do
  c ← parse-char
  case c of λ where
    '"' → pure []
    _   → do
      cs ← parse-chars
      pure (c :: cs)

-- Parses a quoted string: "hello\nworld" etc.
parse-string : Parser String
parse-string = do
  consume "\""
  chars ← parse-chars
  pure (from-list chars)
