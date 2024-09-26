module Base.Parser.Test.parse-string where

open import Base.Parser.parse-string
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Equal.Equal

test-parse-string-normal : parse-string (MkState "\"abc\"" 0) ≡ Done (MkReply (MkState "" 5) "abc")
test-parse-string-normal = refl

test-parse-string-escape : parse-string (MkState "\"a\\nb\"" 0) ≡ Done (MkReply (MkState "" 6) "a\nb")
test-parse-string-escape = refl

test-parse-string-empty : parse-string (MkState "\"\"" 0) ≡ Done (MkReply (MkState "" 2) "")
test-parse-string-empty = refl

test-parse-string-invalid : parse-string (MkState "\"abc" 0) ≡ Fail (MkError 4 "Unexpected end of input")
test-parse-string-invalid = refl
