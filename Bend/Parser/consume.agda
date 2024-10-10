module Bend.Parser.consume where

open import Base.Parser.Parser
open import Base.Parser.Monad.bind
open import Bend.Parser.skip-trivia
open import Bend.Parser.consume-exactly
open import Base.String.String
open import Base.Unit.Unit

-- Consumes the given string from the input after first skipping trivia.
-- - target: The string to be consumed from the input.
-- = A Parser that returns Unit if successful, or fails if the target
--   string is not found in the current index after trivia has been skipped.
consume : String → Parser Unit
consume target = do
  skip-trivia
  consume-exactly target

