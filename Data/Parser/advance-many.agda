module Data.Parser.advance-many where

open import Data.Char.Type
open import Data.List.Type
open import Data.List.drop
open import Data.List.take
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.String.from-list
open import Data.String.to-list

-- Advances the parser by 'count' characters, consuming them.
-- Returns the consumed characters as a Maybe String.
advance-many : Nat → Parser (Maybe String)
advance-many count = λ s →
  let input     = State.input s
      chars     = to-list input
      consumed  = take count chars
      result    = from-list consumed
      new-index = add (State.index s) count
      new-input = from-list (drop count chars)
  in Done (MkReply (MkState new-input new-index) (Some result))
