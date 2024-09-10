module Test.Parser.fail where

open import Data.Parser.fail
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Equal.Type

test-fail : (fail "Test error") (MkState "abcdef" 0) === Fail (MkError 0 "Test error")
test-fail = refl
