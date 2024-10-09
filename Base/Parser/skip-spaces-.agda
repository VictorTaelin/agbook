module Base.Parser.skip-spaces- where

open import Base.Parser.skip-spaces
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

test-skip-spaces-some : skip-spaces (MkState "   abc" 0) ≡ Done (MkReply (MkState "abc" 3) 3)
test-skip-spaces-some = refl

test-skip-spaces-none : skip-spaces (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) 0)
test-skip-spaces-none = refl

test-skip-spaces-all : skip-spaces (MkState "     " 0) ≡ Done (MkReply (MkState "" 5) 5)
test-skip-spaces-all = refl

