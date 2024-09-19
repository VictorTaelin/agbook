module Base.Parser.Test.fail where

open import Base.Parser.fail
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Equal.Type

test-fail : (fail "Test error") (MkState "abcdef" 0) === Fail (MkError 0 "Test error")
test-fail = refl
