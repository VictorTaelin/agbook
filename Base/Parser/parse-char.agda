module Base.Parser.parse-char where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Char.Char
open import Base.Char.eq
open import Base.Char.from-nat
open import Base.Char.is-hex-digit
open import Base.Function.case
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.Parser
open import Base.Parser.advance-one
open import Base.Parser.consume
open import Base.Parser.fail
open import Base.Parser.take-while
open import Base.String.String
open import Base.String.append
open import Base.String.from-char
open import Base.String.to-nat-base

-- Parses a unicode escape sequence.
-- - 1st: Consumes the opening brace.
-- - 2nd: Takes all hexadecimal digits.
-- - 3rd: Consumes the closing brace.
-- - 4th: Converts the hexadecimal string to a natural number.
-- = The character corresponding to the parsed Unicode code point.
parse-unicode-escape : Parser Char
parse-unicode-escape = do
  consume "{"
  digits <- take-while is-hex-digit
  consume "}"
  case to-nat-base 16 digits of λ where
    (Some n) → pure (from-nat n)
    None     → fail "Invalid hexadecimal number in Unicode escape"

-- Parses an escape sequence.
-- - 1st: Advances the parser by one character.
-- - 2nd: Matches the escaped character and returns the corresponding character.
-- = The parsed escaped character.
parse-escape-sequence : Parser Char
parse-escape-sequence = do
  mc <- advance-one
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

-- Parses a single character, including escape sequences.
-- - 1st: Advances the parser by one character.
-- - 2nd: If the character is a backslash, parses an escape sequence; otherwise, returns the character as is.
-- = The parsed character.
parse-char : Parser Char
parse-char = do
  mc <- advance-one
  case mc of λ where
    (Some c) → if (_==_ c '\\') then parse-escape-sequence else pure c
    None     → fail "Unexpected end of input"

