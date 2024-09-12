module Data.Parser.Test.parse-string where

open import Data.Parser.parse-string
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Equal.Type

test-parse-string-normal : parse-string (MkState "\"abc\"" 0) === Done (MkReply (MkState "" 5) "abc")
test-parse-string-normal = refl

test-parse-string-escape : parse-string (MkState "\"a\\nb\"" 0) === Done (MkReply (MkState "" 6) "a\nb")
test-parse-string-escape = refl

test-parse-string-empty : parse-string (MkState "\"\"" 0) === Done (MkReply (MkState "" 2) "")
test-parse-string-empty = refl

test-parse-string-invalid : parse-string (MkState "\"abc" 0) === Fail (MkError 4 "Unexpected end of input")
test-parse-string-invalid = refl