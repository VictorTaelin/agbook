module Data.JSON.Test.parse-null where

open import Data.JSON.Type
open import Data.JSON.parse-null
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-parse-null-success : parse-null (MkState "null" 0) == Done (MkReply (MkState "" 4) JNull)
test-parse-null-success = refl

test-parse-null-success-whitespace : parse-null (MkState "  null" 0) == Done (MkReply (MkState "" 6) JNull)
test-parse-null-success-whitespace = refl

test-parse-null-fail-incomplete : parse-null (MkState "nul" 0) == Fail (MkError 0 "Expected null")
test-parse-null-fail-incomplete = refl

test-parse-null-success-trailing : parse-null (MkState "null123" 0) == Done (MkReply (MkState "123" 4) JNull)
test-parse-null-success-trailing = refl
