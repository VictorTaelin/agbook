module Base.JSON.Test.parse-string where

open import Base.JSON.Type
open import Base.JSON.parse
open import Base.Parser.Type
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Error
open import Base.Result.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type

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

