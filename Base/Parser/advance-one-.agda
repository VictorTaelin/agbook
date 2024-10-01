module Base.Parser.advance-one- where

open import Base.Parser.advance-one
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Char.Char
open import Base.Maybe.Maybe
open import Base.Equal.Equal

test-advance-one-non-empty : advance-one (MkState "abc" 0) ≡ Done (MkReply (MkState "bc" 1) (Some 'a'))
test-advance-one-non-empty = refl

test-advance-one-empty : advance-one (MkState "" 0) ≡ Done (MkReply (MkState "" 0) None)
test-advance-one-empty = refl

test-advance-one-special : advance-one (MkState "!@#" 0) ≡ Done (MkReply (MkState "@#" 1) (Some '!'))
test-advance-one-special = refl