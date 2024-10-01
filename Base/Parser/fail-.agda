module Base.Parser.fail- where

open import Base.Parser.fail
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Equal.Equal

test-fail : (fail "Test error") (MkState "abcdef" 0) ≡ Fail (MkError 0 "Test error")
test-fail = refl
