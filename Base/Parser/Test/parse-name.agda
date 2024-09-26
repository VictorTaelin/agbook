module Base.Parser.Test.parse-name where

open import Base.Parser.parse-name
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Equal.Equal

test-parse-name-valid : parse-name (MkState "abc_123 def" 0) ≡ Done (MkReply (MkState " def" 7) "abc_123")
test-parse-name-valid = refl

test-parse-name-empty : parse-name (MkState " abc" 0) ≡ Fail (MkError 0 "Expected a name")
test-parse-name-empty = refl

test-parse-name-special : parse-name (MkState "abc-def.ghi" 0) ≡ Done (MkReply (MkState "" 11) "abc-def.ghi")
test-parse-name-special = refl
