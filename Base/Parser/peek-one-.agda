module Base.Parser.peek-one- where

open import Base.Parser.peek-one
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Char.Char
open import Base.Maybe.Maybe
open import Base.Equal.Equal

test-peek-one-non-empty : peek-one (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) (Some 'a'))
test-peek-one-non-empty = refl

test-peek-one-empty : peek-one (MkState "" 0) ≡ Done (MkReply (MkState "" 0) None)
test-peek-one-empty = refl

test-peek-one-special : peek-one (MkState "!@#" 0) ≡ Done (MkReply (MkState "!@#" 0) (Some '!'))
test-peek-one-special = refl

