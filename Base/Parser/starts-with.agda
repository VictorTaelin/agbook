module Base.Parser.starts-with where

import Base.String.starts-with as String
open import Base.Bool.Bool
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String

-- Checks if the input starts with a given string.
-- - 1st: The prefix string to check for.
-- = A Parser that returns True if the input starts with the given string, False otherwise.
--   Does not consume any input.
starts-with : String → Parser Bool
starts-with prefix = λ s → do
  let input  = State.input s
  let result = String.starts-with input prefix
  Done (MkReply s result)
