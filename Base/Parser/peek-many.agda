module Base.Parser.peek-many where

open import Base.Bool.if
open import Base.Char.Char
open import Base.List.List
open import Base.List.length
open import Base.List.take
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Nat.eq
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.String.from-list
open import Base.String.to-list

-- Inspects the next 'count' characters in the text without consuming them.
-- - 1st: The number of characters to peek.
-- = A Parser that returns a Maybe String containing the peeked characters, or None if there aren't enough characters.
peek-many : Nat -> Parser (Maybe String)
peek-many count = λ s -> do
  let chars  = to-list (State.input s)
  let peeked = take count chars
  let enough = length peeked == count
  let result = if enough then Some (from-list peeked) else None
  Done (MkReply s result)