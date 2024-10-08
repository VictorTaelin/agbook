module Base.Parser.Monad.pure where

open import Base.Parser.Parser
open import Base.Parser.Reply
open import Base.Parser.State
open import Base.Result.Result

-- Creates a parser that always succeeds with the given value without consuming any input
pure : ∀ {A : Set} → A → Parser A
pure x = λ s → Done (MkReply s x)

