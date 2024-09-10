module Test.Parser.Error where

open import Data.Parser.Error
open import Data.Pair.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-error-fields : let e = MkError 5 "Test error" in (Error.index e , Error.error e) === (5 , "Test error")
test-error-fields = refl