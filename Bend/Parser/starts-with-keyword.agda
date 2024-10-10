module Bend.Parser.starts-with-keyword where

open import Base.Bool.Bool
open import Base.Bool.if
open import Base.Bool.not
open import Base.Function.case
open import Base.List.last
open import Base.Maybe.Maybe
open import Base.Maybe.Trait.Eq
open import Base.Maybe.fold
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String
open import Base.String.Trait.Eq
open import Base.String.head
open import Base.String.length
open import Base.String.to-list
open import Base.Trait.Eq
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.starts-with
open import Base.Parser.peek-many
open import Base.Parser.Monad.pure
open import Base.Parser.Monad.bind
open import Bend.Parser.is-name-char

-- Checks if the input starts with the given keyword (a name followed by a non-name character).
-- = True if the input starts with the keyword, False otherwise.
--   Does not consume any input.
starts-with-keyword : String → Parser Bool
starts-with-keyword keyword = do
  found <- peek-many (length keyword)
  if found == Some keyword
    then (do
      nxt <- peek-many (Succ (length keyword))
      case nxt of λ where
        -- Char after keyword
        (Some nxt) → do
          let nxt = last (to-list nxt)
          pure (fold True (λ c -> not (is-name-char c)) nxt)
        -- EOF after keyword
        None → pure True)
    -- Keyword not found
    else pure False

