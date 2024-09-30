module Base.Parser.consume where

open import Base.Bool.Bool
open import Base.Char.Char
open import Base.Function.case using (case_of_)
open import Base.List.List
open import Base.List.length
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.add
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.String.append
open import Base.String.drop
open import Base.String.starts-with
open import Base.String.to-list
open import Base.Unit.Unit

-- Attempts to consume a specific string from the input.
-- - 1st: The target string to consume.
-- = A Parser that returns unit if successful, or fails if the target string is not found at the current position.
consume : String → Parser Unit
consume target = λ str →
  case starts-with (State.input str) target of λ where
    True → do
      let new-index = add (State.index str) (length (to-list target))
      let new-input = drop (length (to-list target)) (State.input str)
      Done (MkReply (MkState new-input new-index) unit)
    False →
      Fail (MkError (State.index str) ("Expected " ++ target))
