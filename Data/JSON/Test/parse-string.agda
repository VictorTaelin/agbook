module Data.JSON.Test.parse-string where

open import Data.JSON.Type
open import Data.JSON.parse
open import Data.Parser.Type
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Error
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-parse-string-1 : parse-json-string "\"hello\"" == Done (MkReply (MkState "" 7) (JString "hello"))
test-parse-string-1 = refl

test-parse-string-2 : parse-json-string "  \"world\"  " == Done (MkReply (MkState "  " 9) (JString "world"))
test-parse-string-2 = refl

test-parse-string-3 : parse-json-string "\"\"" == Done (MkReply (MkState "" 2) (JString ""))
test-parse-string-3 = refl

test-parse-string-4 : parse-json-string "\"unclosed" == Fail (MkError 0 "Expected {")
test-parse-string-4 = refl

test-parse-string-5 : parse-json-string "\"\\u263A\"" == Done (MkReply (MkState "" 8) (JString "☺"))
test-parse-string-5 = refl

