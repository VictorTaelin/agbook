module Base.Parser.get-index where

open import Base.Parser.Error
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type
open import Base.Nat.Type

get-index : Parser Nat
get-index = λ s → Done (MkReply s (State.index s))
