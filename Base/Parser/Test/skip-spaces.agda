module Base.Parser.Test.skip-spaces where

open import Base.Parser.skip-spaces
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type

test-skip-spaces-some : skip-spaces (MkState "   abc" 0) === Done (MkReply (MkState "abc" 3) 3)
test-skip-spaces-some = refl

test-skip-spaces-none : skip-spaces (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) 0)
test-skip-spaces-none = refl

test-skip-spaces-all : skip-spaces (MkState "     " 0) === Done (MkReply (MkState "" 5) 5)
test-skip-spaces-all = refl