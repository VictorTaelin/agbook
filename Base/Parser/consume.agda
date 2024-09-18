module Base.Parser.consume where

open import Base.Bool.Type
open import Base.Char.Type
open import Base.Function.case using (case_of_)
open import Base.List.Type
open import Base.List.length
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.add
open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.String.append
open import Base.String.drop
open import Base.String.starts-with
open import Base.String.to-list
open import Base.Unit.Type

-- Tries to consume a specific string from the input.
-- Returns unit if successful.
consume : String → Parser Unit
consume target = λ str →
  case starts-with (State.input str) target of λ where
    True → do
      let new-index = add (State.index str) (length (to-list target))
      let new-input = drop (length (to-list target)) (State.input str)
      Done (MkReply (MkState new-input new-index) unit)
    False →
      Fail (MkError (State.index str) ("Expected " ++ target))
