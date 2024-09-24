module Base.Parser.fail where

open import Base.Parser.Type
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Result.Type
open import Base.String.Type

-- Creates a failing parser with the given error message
fail : ∀ {A : Set} -> String -> Parser A
fail msg = λ s -> Fail (MkError (State.index s) msg)
