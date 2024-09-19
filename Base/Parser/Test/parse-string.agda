module Base.Parser.Test.parse-string where

open import Base.Parser.parse-string
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Equal.Type

test-parse-string-normal : parse-string (MkState "\"abc\"" 0) === Done (MkReply (MkState "" 5) "abc")
test-parse-string-normal = refl

test-parse-string-escape : parse-string (MkState "\"a\\nb\"" 0) === Done (MkReply (MkState "" 6) "a\nb")
test-parse-string-escape = refl

test-parse-string-empty : parse-string (MkState "\"\"" 0) === Done (MkReply (MkState "" 2) "")
test-parse-string-empty = refl

test-parse-string-invalid : parse-string (MkState "\"abc" 0) === Fail (MkError 4 "Unexpected end of input")
test-parse-string-invalid = refl
