module Data.Parser.starts-with where

open import Data.Bool.Type
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Result.Type
open import Data.String.Type
import Data.String.starts-with as String

-- Checks if the input starts with the given string.
-- Returns True if the input starts with the given string, False otherwise.
-- Does not consume any input.
starts-with : String → Parser Bool
starts-with prefix = λ s → do
  let input  = State.input s
  let result = String.starts-with input prefix
  Done (MkReply s result)
