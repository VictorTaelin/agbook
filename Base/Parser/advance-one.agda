module Base.Parser.advance-one where

open import Base.Char.Type
open import Base.Function.case
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type
open import Base.Pair.Type
open import Base.Pair.get-fst
open import Base.Pair.get-snd
open import Base.String.Type
open import Base.String.uncons

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
