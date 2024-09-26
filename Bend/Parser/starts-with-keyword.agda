module Bend.Parser.starts-with-keyword where

open import Base.Function.case
open import Base.Bool.Bool
open import Base.Bool.and
open import Base.Bool.not
open import Base.Char.Char
open import Base.String.String
open import Base.String.length
open import Base.String.split-at
open import Base.String.eq
open import Base.String.head
open import Base.Nat.Nat
open import Base.Maybe.Maybe
open import Base.Maybe.fold
open import Base.Pair.Pair
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.starts-with
open import Base.Parser.peek-many
open import Base.Parser.Monad.pure
open import Base.Parser.Monad.bind
open import Bend.Parser.is-name-char

-- Checks if the input starts with the given keyword.
-- Returns True if the input starts with the keyword and is followed by a non-name character.
-- Returns False otherwise.
-- Does not consume any input.
starts-with-keyword : String -> Parser Bool
starts-with-keyword keyword = do
  prefix <- peek-many (Succ (length keyword))
  case prefix of λ where
    (Some prefix) -> do
      let (keyword' , nxt) = split-at (length keyword) prefix
      let starts-with = keyword' == keyword
      let nxt-is-name = fold False is-name-char (head nxt)
      pure (starts-with && not nxt-is-name)
    None -> pure False
