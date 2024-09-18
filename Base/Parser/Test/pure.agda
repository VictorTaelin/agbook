module Base.Parser.Test.pure where

open import Base.Parser.pure
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Type
open import Base.Result.Type
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type

test-pure-nat : (pure 42) (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) 42)
test-pure-nat = refl

test-pure-string : (pure "hello") (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) "hello")
test-pure-string = refl