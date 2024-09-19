module Base.Parser.is-eof where

open import Base.Bool.Type
open import Base.Parser.Type
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Result.Type
open import Base.String.Type
open import Base.String.is-empty

-- Checks if the parser has reached the end of the input.
-- Returns True if at the end of input, False otherwise.
is-eof : Parser Bool
is-eof = λ s → do
  let input  = State.input s
  let result = is-empty input
  Done (MkReply s result)
