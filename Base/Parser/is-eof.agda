module Base.Parser.is-eof where

open import Base.Bool.Bool
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.String.is-empty

-- Checks if the parser has reached the end of the input.
-- - 1st: The parser state.
-- = A Reply containing a Bool: True if at the end of input, False otherwise.
is-eof : Parser Bool
is-eof = λ s -> do
  let input  = State.input s
  let result = is-empty input
  Done (MkReply s result)
