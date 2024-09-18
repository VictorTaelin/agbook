module Base.Parser.peek-many where

open import Base.Bool.if
open import Base.Char.Type
open import Base.List.Type
open import Base.List.length
open import Base.List.take
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Nat.eq
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.String.from-list
open import Base.String.to-list

-- Inspects the next 'count' characters in the text without consuming them.
-- Returns a Maybe String containing the peeked characters, or None if there aren't enough characters.
peek-many : Nat → Parser (Maybe String)
peek-many count = λ s → do
  let chars  = to-list (State.input s)
  let peeked = take count chars
  let enough = length peeked == count
  let result = if enough then Some (from-list peeked) else None
  Done (MkReply s result)
