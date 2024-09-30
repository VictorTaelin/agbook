module Base.Parser.skip-spaces where

open import Base.Char.Char
open import Base.Char.is-space
open import Base.List.List
open import Base.List.drop
open import Base.List.length
open import Base.List.take-while
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.String.from-list
open import Base.String.to-list

-- Skips spaces in the text and returns the number of spaces skipped.
-- - 1st: The parser state.
-- = A Reply containing the updated state and the number of spaces skipped.
skip-spaces : Parser Nat
skip-spaces = λ s → do
  let input     = State.input s
  let chars     = to-list input
  let skipped   = take-while is-space chars
  let count     = length skipped
  let new-index = add (State.index s) count
  let new-input = from-list (drop count chars)
  Done (MkReply (MkState new-input new-index) count)
