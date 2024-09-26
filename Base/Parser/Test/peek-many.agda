module Base.Parser.Test.peek-many where

open import Base.Parser.peek-many
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Maybe.Maybe
open import Base.Nat.Nat
open import Base.Equal.Equal

test-peek-many-some : (peek-many 3) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) (Some "abc"))
test-peek-many-some = refl

test-peek-many-all : (peek-many 6) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) (Some "abcdef"))
test-peek-many-all = refl

test-peek-many-too-many : (peek-many 10) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) None)
test-peek-many-too-many = refl

test-peek-many-empty : (peek-many 3) (MkState "" 0) ≡ Done (MkReply (MkState "" 0) None)
test-peek-many-empty = refl