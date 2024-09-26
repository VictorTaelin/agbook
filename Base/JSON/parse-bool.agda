module Base.JSON.parse-bool where

open import Base.JSON.JSON
open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.consume
open import Base.Parser.Monad.pure
open import Base.Parser.skip-spaces
open import Base.Parser.alternative
open import Base.Bool.Bool

-- Parses a JSON boolean value.
-- - Skips any leading whitespace.
-- - Consumes either "true" or "false" string.
-- - Returns a JBool JSON value.
parse-bool : Parser JSON
parse-bool = do
  skip-spaces
  b <- (consume "true" >> pure True) <|> (consume "false" >> pure False)
  pure (JBool b)
