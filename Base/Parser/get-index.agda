module Base.Parser.get-index where

open import Base.Nat.Nat
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result

-- Returns the current index of the parser state.
-- - 1st: The parser state.
-- = A Reply containing the current state and the current index.
get-index : Parser Nat
get-index = λ s → Done (MkReply s (State.index s))

