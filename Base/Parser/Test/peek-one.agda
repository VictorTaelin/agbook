module Base.Parser.Test.peek-one where

open import Base.Parser.peek-one
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Char.Type
open import Base.Maybe.Type
open import Base.Equal.Type

test-peek-one-non-empty : peek-one (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) (Some 'a'))
test-peek-one-non-empty = refl

test-peek-one-empty : peek-one (MkState "" 0) === Done (MkReply (MkState "" 0) None)
test-peek-one-empty = refl

test-peek-one-special : peek-one (MkState "!@#" 0) === Done (MkReply (MkState "!@#" 0) (Some '!'))
test-peek-one-special = refl