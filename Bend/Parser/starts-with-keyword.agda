module Bend.Parser.starts-with-keyword where

open import Data.Function.case
open import Data.Bool.Type
open import Data.Bool.and
open import Data.Bool.not
open import Data.Char.Type
open import Data.String.Type
open import Data.String.length
open import Data.String.split-at
open import Data.String.eq
open import Data.String.head
open import Data.Nat.Type
open import Data.Maybe.Type
open import Data.Maybe.maybe
open import Data.Maybe.map
open import Data.Pair.Type
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.starts-with
open import Data.Parser.peek-many
open import Data.Parser.pure
open import Data.Parser.bind
open import Bend.Parser.is-name-char

-- Checks if the input starts with the given keyword.
-- Returns True if the input starts with the keyword and is followed by a non-name character.
-- Returns False otherwise.
-- Does not consume any input.
starts-with-keyword : String → Parser Bool
starts-with-keyword keyword = do
  prefix ← peek-many (Succ (length keyword))
  case prefix of λ where
    (Some prefix) → do
      let (keyword' , nxt) = split-at (length keyword) prefix
      let starts-with = keyword' == keyword
      let nxt-is-name = maybe False is-name-char (head nxt)
      pure (starts-with && not nxt-is-name) 
    None → pure False
 