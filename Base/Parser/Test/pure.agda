module Base.Parser.Test.pure where

open import Base.Parser.Monad.pure
open import Base.Parser.State
open import Base.Parser.Reply
open import Base.Parser.Parser
open import Base.Result.Result
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

test-pure-nat : (pure 42) (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) 42)
test-pure-nat = refl

test-pure-string : (pure "hello") (MkState "abc" 0) ≡ Done (MkReply (MkState "abc" 0) "hello")
test-pure-string = refl