module Test.Parser.parse-quoted-char where

open import Data.Parser.parse-quoted-char
open import Data.Parser.Error
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Char.Type
open import Data.Nat.Type
open import Data.Bool.Type
open import Data.Maybe.Type
open import Data.Equal.Type

test-parse-quoted-char-normal : parse-quoted-char (MkState "'a'" 0) === Done (MkReply (MkState "" 3) 'a')
test-parse-quoted-char-normal = refl

test-parse-quoted-char-escape : parse-quoted-char (MkState "'\\n'" 0) === Done (MkReply (MkState "" 4) '\n')
test-parse-quoted-char-escape = refl

test-parse-quoted-char-invalid : parse-quoted-char (MkState "'ab'" 0) === Fail (MkError 2 "Expected '")
test-parse-quoted-char-invalid = refl