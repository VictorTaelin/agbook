module Base.Parser.parse-quoted-char- where

open import Base.Parser.parse-quoted-char
open import Base.Parser.Error
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Char.Char
open import Base.Nat.Nat
open import Base.Bool.Bool
open import Base.Maybe.Maybe
open import Base.Equal.Equal

test-parse-quoted-char-normal : parse-quoted-char (MkState "'a'" 0) ≡ Done (MkReply (MkState "" 3) 'a')
test-parse-quoted-char-normal = refl

test-parse-quoted-char-escape : parse-quoted-char (MkState "'\\n'" 0) ≡ Done (MkReply (MkState "" 4) '\n')
test-parse-quoted-char-escape = refl

test-parse-quoted-char-invalid : parse-quoted-char (MkState "'ab'" 0) ≡ Fail (MkError 2 "Expected '")
test-parse-quoted-char-invalid = refl