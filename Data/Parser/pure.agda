module Data.Parser.pure where

open import Data.Parser.Type
open import Data.Parser.Reply
open import Data.Parser.State
open import Data.Result.Type

-- Creates a parser that always succeeds with the given value without consuming any input
pure : ∀ {A : Set} → A → Parser A
pure x = λ s → Done (MkReply s x)
