module Base.Parser.parse-string where

open import Base.Char.Type
open import Base.Function.case
open import Base.List.Type
open import Base.Parser.Type
open import Base.Parser.bind
open import Base.Parser.consume
open import Base.Parser.fail
open import Base.Parser.parse-char
open import Base.Parser.pure
open import Base.String.Type
open import Base.String.from-list

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
