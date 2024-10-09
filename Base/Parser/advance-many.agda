module Base.Parser.advance-many where

open import Base.Char.Char
open import Base.List.List
open import Base.List.drop
open import Base.List.take
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

-- Advances the parser by a specified number of characters and returns the consumed characters.
-- - 1st: The number of characters to advance.
-- = A Parser that returns a Maybe String containing the consumed characters.
advance-many : Nat → Parser (Maybe String)
advance-many count = λ s →
  let input     = State.input s
      chars     = to-list input
      consumed  = take count chars
      result    = from-list consumed
      new-index = add (State.index s) count
      new-input = from-list (drop count chars)
  in Done (MkReply (MkState new-input new-index) (Some result))

