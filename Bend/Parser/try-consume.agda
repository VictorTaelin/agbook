module Bend.Parser.try-consume where

open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Base.Parser.Monad.pure
open import Base.Parser.alternative
open import Bend.Parser.skip-trivia
open import Bend.Parser.consume-exactly
open import Base.Bool.Bool
open import Base.String.String

-- Tries to consume the given string from the input after first skipping trivia.
-- - target: The string to be consumed from the input.
-- = True if the target was consumed, False otherwise.
--   Does not consume any input in the case of failure.
try-consume : String → Parser Bool
try-consume target = do
  skip-trivia
  (consume-exactly target >> (pure True)) <|> (pure False)

