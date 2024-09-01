module Data.Parser.fail where

open import Data.Parser.Type
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Result.Type
open import Data.String.Type

-- Creates a failing parser with the given error message
fail : ∀ {A : Set} → String → Parser A
fail msg = λ s → Fail (MkError (State.index s) msg)
