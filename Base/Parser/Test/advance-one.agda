module Base.Parser.Test.advance-one where

open import Base.Parser.advance-one
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Char.Type
open import Base.Maybe.Type
open import Base.Equal.Type

test-advance-one-non-empty : advance-one (MkState "abc" 0) ≡ Done (MkReply (MkState "bc" 1) (Some 'a'))
test-advance-one-non-empty = refl

test-advance-one-empty : advance-one (MkState "" 0) ≡ Done (MkReply (MkState "" 0) None)
test-advance-one-empty = refl

test-advance-one-special : advance-one (MkState "!@#" 0) ≡ Done (MkReply (MkState "@#" 1) (Some '!'))
test-advance-one-special = refl