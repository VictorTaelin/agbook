module Test.Parser.parse-char where

open import Data.Parser.parse-char
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Char.Type
open import Data.Equal.Type
open import Data.Nat.Type

test-parse-char-normal : parse-char (MkState "abc" 0) == Done (MkReply (MkState "bc" 1) 'a')
test-parse-char-normal = refl

test-parse-char-escape : parse-char (MkState "\\nabc" 0) == Done (MkReply (MkState "abc" 2) '\n')
test-parse-char-escape = refl

test-parse-char-unicode : parse-char (MkState "\\u{1F600}abc" 0) == Done (MkReply (MkState "abc" 9) '😀')
test-parse-char-unicode = refl

test-parse-char-invalid-escape : parse-char (MkState "\\xabc" 0) == Fail (MkError 2 "Invalid escape character: x")
test-parse-char-invalid-escape = refl
