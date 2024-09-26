module Base.Parser.parse-quoted-char where

open import Base.Char.Char
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Parser
open import Base.Parser.consume
open import Base.Parser.parse-char

-- Parses a quoted character.
-- - 1st: Consumes the opening single quote.
-- - 2nd: Parses a single character.
-- - 3rd: Consumes the closing single quote.
-- = Returns the parsed character.
parse-quoted-char : Parser Char
parse-quoted-char = do
  consume "'"
  c <- parse-char
  consume "'"
  pure c