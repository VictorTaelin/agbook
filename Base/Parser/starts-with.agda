module Base.Parser.starts-with where

open import Base.Bool.Type
open import Base.Parser.Type
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Result.Type
open import Base.String.Type
import Base.String.starts-with as String

-- Checks if the input starts with the given string.
-- Returns True if the input starts with the given string, False otherwise.
-- Does not consume any input.
starts-with : String -> Parser Bool
starts-with prefix = λ s -> do
  let input  = State.input s
  let result = String.starts-with input prefix
  Done (MkReply s result)
