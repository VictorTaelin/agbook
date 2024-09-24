module Base.Parser.parse-quoted-char where

open import Base.Char.Type
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Type
open import Base.Parser.consume
open import Base.Parser.parse-char

-- Parses a quoted character: 'c' or '\n' etc.
parse-quoted-char : Parser Char
parse-quoted-char = do
  consume "'"
  c <- parse-char
  consume "'"
  pure c
