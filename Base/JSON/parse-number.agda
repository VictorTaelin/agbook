module Base.JSON.parse-number where

open import Base.JSON.Type
open import Base.Parser.Type
open import Base.Parser.Monad.bind
open import Base.Parser.consume
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Base.Parser.fail
open import Base.Parser.skip-spaces
open import Base.Parser.take-while
open import Base.Char.is-digit
open import Base.Float.from-string
open import Base.Float.mul renaming (_*_ to _f*_)
open import Base.Float.exp renaming (_^_ to _f^_)
open import Base.Function.case
open import Base.String.append
open import Base.String.Type
open import Base.String.eq
open import Base.Bool.Type
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.exp

is-empty : String -> Bool
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
    True -> fail "Invalid number: no digits in integer part"
    False -> case from-string base-num-str of λ where
      (Some base-num) -> 
        case exp-part of λ where
          "" -> pure (JNumber base-num)
          _ -> case from-string exp-part of λ where
            (Some exp-num) -> pure (JNumber (base-num f* (10.0 f^ exp-num)))
            None -> fail ("Invalid exponent: " ++ exp-part)
      None -> fail ("Invalid number: " ++ base-num-str)
