module Base.Parser.fail where

open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String

-- Creates a failing parser with the given error message.
-- - 1st: The error message as a String.
-- = A Parser that always fails with the specified error message.
fail : ∀ {A : Set} → String → Parser A
fail msg = λ s → Fail (MkError (State.index s) msg)

