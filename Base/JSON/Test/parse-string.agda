module Base.JSON.Test.parse-string where

open import Base.JSON.JSON
open import Base.JSON.parse
open import Base.Parser.Parser
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Result
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

test-parse-string-1 : parse-json-string "\"hello\"" ≡ Done (MkReply (MkState "" 7) (JString "hello"))
test-parse-string-1 = refl

test-parse-string-2 : parse-json-string "  \"world\"  " ≡ Done (MkReply (MkState "  " 9) (JString "world"))
test-parse-string-2 = refl

test-parse-string-3 : parse-json-string "\"\"" ≡ Done (MkReply (MkState "" 2) (JString ""))
test-parse-string-3 = refl

test-parse-string-4 : parse-json-string "\"unclosed" ≡ Fail (MkError 0 "Expected {")
test-parse-string-4 = refl

test-parse-string-5 : parse-json-string "\"\\u263A\"" ≡ Done (MkReply (MkState "" 8) (JString "☺"))
test-parse-string-5 = refl

