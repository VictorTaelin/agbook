module Data.Parser.peek-many where

open import Data.Bool.if
open import Data.Char.Type
open import Data.List.Type
open import Data.List.length
open import Data.List.take
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Nat.eq
open import Data.Trait.Eq
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.String.from-list
open import Data.String.to-list

-- Inspects the next 'count' characters in the text without consuming them.
-- Returns a Maybe String containing the peeked characters, or None if there aren't enough characters.
peek-many : Nat → Parser (Maybe String)
peek-many count = λ s → do
  let chars  = to-list (State.input s)
  let peeked = take count chars
  let enough = length peeked == count
  let result = if enough then Some (from-list peeked) else None
  Done (MkReply s result)
