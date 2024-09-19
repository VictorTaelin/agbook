module Base.Parser.Test.Error where

open import Base.Parser.Error
open import Base.Pair.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type

test-error-fields : let e = MkError 5 "Test error" in (Error.index e , Error.error e) === (5 , "Test error")
test-error-fields = refl