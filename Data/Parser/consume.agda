module Data.Parser.consume where

open import Data.Bool.Type
open import Data.Char.Type
open import Data.Function.case using (case_of_)
open import Data.List.Type
open import Data.List.length
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Parser.Error
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.String.append
open import Data.String.drop
open import Data.String.starts-with
open import Data.String.to-list
open import Data.Unit.Type

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
