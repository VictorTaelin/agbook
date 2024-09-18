module Base.Parser.Test.parse-quoted-char where

open import Base.Parser.parse-quoted-char
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Char.Type
open import Base.Nat.Type
open import Base.Bool.Type
open import Base.Maybe.Type
open import Base.Equal.Type

test-parse-quoted-char-normal : parse-quoted-char (MkState "'a'" 0) === Done (MkReply (MkState "" 3) 'a')
test-parse-quoted-char-normal = refl

test-parse-quoted-char-escape : parse-quoted-char (MkState "'\\n'" 0) === Done (MkReply (MkState "" 4) '\n')
test-parse-quoted-char-escape = refl

test-parse-quoted-char-invalid : parse-quoted-char (MkState "'ab'" 0) === Fail (MkError 2 "Expected '")
test-parse-quoted-char-invalid = refl