module Base.Parser.Test.advance-many where

open import Base.Parser.advance-many
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Maybe.Type
open import Base.Equal.Type

test-advance-many-valid : (advance-many 3) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "def" 3) (Some "abc"))
test-advance-many-valid = refl

test-advance-many-too-many : (advance-many 10) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "" 10) (Some "abcdef"))
test-advance-many-too-many = refl

test-advance-many-exact : (advance-many 6) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "" 6) (Some "abcdef"))
test-advance-many-exact = refl

test-advance-many-empty : (advance-many 3) (MkState "" 0) ≡ Done (MkReply (MkState "" 3) (Some ""))
test-advance-many-empty = refl

test-advance-many-non-zero-start : (advance-many 3) (MkState "abcdef" 2) ≡ Done (MkReply (MkState "def" 5) (Some "abc"))
test-advance-many-non-zero-start = refl

test-advance-many-zero : (advance-many 0) (MkState "abcdef" 0) ≡ Done (MkReply (MkState "abcdef" 0) (Some ""))
test-advance-many-zero = refl

test-advance-many-unicode : (advance-many 2) (MkState "🌟🌠✨" 0) ≡ Done (MkReply (MkState "✨" 2) (Some "🌟🌠"))
test-advance-many-unicode = refl

test-advance-many-beyond-length-non-zero-start : (advance-many 8) (MkState "abcdef" 2) ≡ Done (MkReply (MkState "" 10) (Some "abcdef"))
test-advance-many-beyond-length-non-zero-start = refl
