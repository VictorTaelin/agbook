module Base.Parser.Test.parse-char where

open import Base.Parser.parse-char
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Char.Type
open import Base.Equal.Type
open import Base.Nat.Type

test-parse-char-normal : parse-char (MkState "abc" 0) ≡ Done (MkReply (MkState "bc" 1) 'a')
test-parse-char-normal = refl

test-parse-char-escape : parse-char (MkState "\\nabc" 0) ≡ Done (MkReply (MkState "abc" 2) '\n')
test-parse-char-escape = refl

test-parse-char-unicode : parse-char (MkState "\\u{1F600}abc" 0) ≡ Done (MkReply (MkState "abc" 9) '😀')
test-parse-char-unicode = refl

test-parse-char-invalid-escape : parse-char (MkState "\\xabc" 0) ≡ Fail (MkError 2 "Invalid escape character: x")
test-parse-char-invalid-escape = refl
