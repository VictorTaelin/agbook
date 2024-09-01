module Data.Parser.advance-one where

open import Data.Char.Type
open import Data.Function.case
open import Data.Maybe.Type
open import Data.Nat.Type
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Parser.Type
open import Data.Result.Type
open import Data.Sigma.Type
open import Data.Sigma.fst
open import Data.Sigma.snd
open import Data.String.Type
open import Data.String.uncons

-- Advances the parser by one character, consuming it.
-- Returns the consumed character if successful.
advance-one : Parser (Maybe Char)
advance-one = λ str →
  case uncons (State.input str) of λ where
    None →
      Done (MkReply str None)
    (Some pair) → do
      let head = get-fst pair
      let tail = get-snd pair
      Done (MkReply (MkState tail (Succ (State.index str))) (Some head))
