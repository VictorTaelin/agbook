module Data.Parser.skip-spaces where

open import Data.Char.Type
open import Data.Char.is-space
open import Data.List.Type
open import Data.List.drop
open import Data.List.length
open import Data.List.take-while
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

-- Skips spaces in the text.
-- Returns the number of spaces skipped.
skip-spaces : Parser Nat
skip-spaces = λ s → do
  let input     = State.input s
  let chars     = to-list input
  let skipped   = take-while is-space chars
  let count     = length skipped
  let new-index = add (State.index s) count
  let new-input = from-list (drop count chars)
  Done (MkReply (MkState new-input new-index) count)
