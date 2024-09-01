module Data.Parser.take-while where

open import Data.Bool.Type
open import Data.Char.Type
open import Data.List.Type
import Data.List.take-while as List
open import Data.List.length
open import Data.List.drop
open import Data.Nat.Type
open import Data.Nat.add
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Result.Type
open import Data.String.Type
open import Data.String.from-list
open import Data.String.to-list

-- Consumes characters from the input as long as they satisfy the given predicate.
-- Returns the consumed string.
take-while : (Char → Bool) → Parser String
take-while pred = λ s → do
  let input     = State.input s
  let chars     = to-list input
  let consumed  = List.take-while pred chars
  let result    = from-list consumed
  let count     = length consumed
  let new-index = add (State.index s) count
  let new-input = from-list (drop count chars)
  Done (MkReply (MkState new-input new-index) result)
