module Base.JSON.Test.parse-null where

open import Base.JSON.JSON
open import Base.JSON.parse-null
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

test-parse-null-success : parse-null (MkState "null" 0) ≡ Done (MkReply (MkState "" 4) JNull)
test-parse-null-success = refl

test-parse-null-success-whitespace : parse-null (MkState "  null" 0) ≡ Done (MkReply (MkState "" 6) JNull)
test-parse-null-success-whitespace = refl

test-parse-null-fail-incomplete : parse-null (MkState "nul" 0) ≡ Fail (MkError 0 "Expected null")
test-parse-null-fail-incomplete = refl

test-parse-null-success-trailing : parse-null (MkState "null123" 0) ≡ Done (MkReply (MkState "123" 4) JNull)
test-parse-null-success-trailing = refl

