module Base.Parser.Test.parse-char where

open import Base.Parser.parse-char
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Char.Char
open import Base.Equal.Equal
open import Base.Nat.Nat

test-parse-char-normal : parse-char (MkState "abc" 0) ≡ Done (MkReply (MkState "bc" 1) 'a')
test-parse-char-normal = refl

test-parse-char-escape : parse-char (MkState "\\nabc" 0) ≡ Done (MkReply (MkState "abc" 2) '\n')
test-parse-char-escape = refl

test-parse-char-unicode : parse-char (MkState "\\u{1F600}abc" 0) ≡ Done (MkReply (MkState "abc" 9) '😀')
test-parse-char-unicode = refl

test-parse-char-invalid-escape : parse-char (MkState "\\xabc" 0) ≡ Fail (MkError 2 "Invalid escape character: x")
test-parse-char-invalid-escape = refl
