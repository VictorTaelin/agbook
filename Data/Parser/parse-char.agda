module Data.Parser.parse-char where

open import Data.Bool.Type
open import Data.Bool.if
open import Data.Char.Type
open import Data.Char.eq
open import Data.Char.from-nat
open import Data.Char.is-hex-digit
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Parser.Type
open import Data.Parser.advance-one
open import Data.Parser.bind
open import Data.Parser.consume
open import Data.Parser.fail
open import Data.Parser.pure
open import Data.Parser.take-while
open import Data.String.Type
open import Data.String.append
open import Data.String.from-char
open import Data.String.to-nat-base

-- Parses a unicode escape sequence (e.g., \u{1F600})
parse-unicode-escape : Parser Char
parse-unicode-escape = do
  consume "{"
  digits ← take-while is-hex-digit
  consume "}"
  case to-nat-base 16 digits of λ where
    (Some n) → pure (from-nat n)
    None     → fail "Invalid hexadecimal number in Unicode escape"

-- Parses an escape sequence
parse-escape-sequence : Parser Char
parse-escape-sequence = do
  mc ← advance-one
  case mc of λ where
    (Some c) → 
      case c of λ where
        'n'  → pure '\n'
        'r'  → pure '\r'
        't'  → pure '\t'
        '\\' → pure '\\'
        '\'' → pure '\''
        '"'  → pure '"'
        'u'  → parse-unicode-escape
        _    → fail ("Invalid escape character: " ++ from-char c)
    None → fail "Unexpected end of input in escape sequence"

-- Parses a single character, including escape sequences
parse-char : Parser Char
parse-char = do
  mc ← advance-one
  case mc of λ where
    (Some c) → if (_==_ c '\\') then parse-escape-sequence else pure c
    None     → fail "Unexpected end of input"
