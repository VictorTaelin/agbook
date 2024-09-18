module Base.Parser.Test.is-eof where

open import Base.Parser.is-eof
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Bool.Type
open import Base.Equal.Type

test-is-eof-true : is-eof (MkState "" 0) === Done (MkReply (MkState "" 0) True)
test-is-eof-true = refl

test-is-eof-false : is-eof (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) False)
test-is-eof-false = refl

