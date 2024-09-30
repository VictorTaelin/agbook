module Base.Parser.parse-string where

open import Base.Char.Char
open import Base.Function.case
open import Base.List.List
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Parser
open import Base.Parser.consume
open import Base.Parser.fail
open import Base.Parser.parse-char
open import Base.String.String
open import Base.String.from-list

-- Parses multiple characters until a closing quote is encountered.
-- - 1st: The current character.
-- - 2nd: The rest of the characters (recursively parsed).
-- = A list of characters representing the parsed string content.
{-# TERMINATING #-} -- FIXME!
parse-chars : Parser (List Char)
parse-chars = do
  c <- parse-char
  case c of λ where
    '"' → pure []
    _   → do
      cs <- parse-chars
      pure (c :: cs)

-- Parses a quoted string.
-- - 1st: Consumes the opening quote.
-- - 2nd: Parses the string content.
-- = A String value representing the parsed quoted string.
parse-string : Parser String
parse-string = do
  consume "\""
  chars <- parse-chars
  pure (from-list chars)