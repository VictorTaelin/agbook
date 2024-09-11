module Data.JSON.parse-number where

open import Data.JSON.Type
open import Data.Parser.Type
open import Data.Parser.bind
open import Data.Parser.consume
open import Data.Parser.pure
open import Data.Parser.alternative
open import Data.Parser.fail
open import Data.Parser.skip-spaces
open import Data.Parser.take-while
open import Data.Char.is-digit
open import Data.Float.from-string
open import Data.Float.mul
open import Data.Float.pow renaming (_^_ to _f^_)
open import Data.Function.case
open import Data.String.append
open import Data.String.Type
open import Data.String.eq
open import Data.Bool.Type
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.exp

is-empty : String → Bool
is-empty s = s == ""

-- Parses a JSON number value.
-- - Skips leading whitespace.
-- - Parses an optional minus sign.
-- - Parses the integer part.
-- - Optionally parses the fractional part.
-- - Optionally parses the exponential part.
-- = Returns a JNumber JSON value if successful, or fails with an error message.
parse-number : Parser JSON
parse-number = do
  skip-spaces
  sign <- (consume "-" >> pure "-") <|> pure ""
  int-part <- take-while is-digit
  frac-part <- (do
    consume "."
    frac <- take-while is-digit
    pure ("." ++ frac)) <|> pure ""

  exp-part <- (do
    _ <- consume "e" <|> consume "E"
    exp-sign <- (consume "+" >> pure "+") <|> (consume "-" >> pure "-") <|> pure "+"
    exp-digits <- take-while is-digit
    pure (exp-sign ++ exp-digits)) <|> pure ""

  let base-num-str = sign ++ int-part ++ frac-part
  case is-empty int-part of λ where
    True → fail "Invalid number: no digits in integer part"
    False → case from-string base-num-str of λ where
      (Some base-num) → 
        case exp-part of λ where
          "" → pure (JNumber base-num)
          _ → case from-string exp-part of λ where
            (Some exp-num) → pure (JNumber (base-num * (10.0 f^ exp-num)))
            None → fail ("Invalid exponent: " ++ exp-part)
      None → fail ("Invalid number: " ++ base-num-str)


