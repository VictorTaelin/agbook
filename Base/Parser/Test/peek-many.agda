module Base.Parser.Test.peek-many where

open import Base.Parser.peek-many
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Maybe.Type
open import Base.Nat.Type
open import Base.Equal.Type

test-peek-many-some : (peek-many 3) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) (Some "abc"))
test-peek-many-some = refl

test-peek-many-all : (peek-many 6) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) (Some "abcdef"))
test-peek-many-all = refl

test-peek-many-too-many : (peek-many 10) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) None)
test-peek-many-too-many = refl

test-peek-many-empty : (peek-many 3) (MkState "" 0) ≡ Done (MkReply (MkState "" 0) None)
test-peek-many-empty = refl