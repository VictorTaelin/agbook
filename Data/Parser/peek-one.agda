module Data.Parser.peek-one where

open import Data.Char.Type
open import Data.Maybe.Type
open import Data.Parser.Error
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.head

peek-one : Parser (Maybe Char)
peek-one = λ s → Done (MkReply s (head (State.input s)))
