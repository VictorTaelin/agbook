module Data.Parser.Test.parse-name where

open import Data.Parser.parse-name
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Equal.Type

test-parse-name-valid : parse-name (MkState "abc_123 def" 0) === Done (MkReply (MkState " def" 7) "abc_123")
test-parse-name-valid = refl

test-parse-name-empty : parse-name (MkState " abc" 0) === Fail (MkError 0 "Expected a name")
test-parse-name-empty = refl

test-parse-name-special : parse-name (MkState "abc-def.ghi" 0) === Done (MkReply (MkState "" 11) "abc-def.ghi")
test-parse-name-special = refl
