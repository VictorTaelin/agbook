module Data.Parser.is-eof where

open import Data.Bool.Type
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Result.Type
open import Data.String.Type
open import Data.String.is-empty

-- Checks if the parser has reached the end of the input.
-- Returns True if at the end of input, False otherwise.
is-eof : Parser Bool
is-eof = λ s → do
  let input  = State.input s
  let result = is-empty input
  Done (MkReply s result)
