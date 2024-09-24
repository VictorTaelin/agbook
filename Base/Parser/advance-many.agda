module Base.Parser.advance-many where

open import Base.Char.Type
open import Base.List.Type
open import Base.List.drop
open import Base.List.take
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.String.from-list
open import Base.String.to-list

-- Advances the parser by 'count' characters, consuming them.
-- Returns the consumed characters as a Maybe String.
advance-many : Nat -> Parser (Maybe String)
advance-many count = λ s ->
  let input     = State.input s
      chars     = to-list input
      consumed  = take count chars
      result    = from-list consumed
      new-index = add (State.index s) count
      new-input = from-list (drop count chars)
  in Done (MkReply (MkState new-input new-index) (Some result))
