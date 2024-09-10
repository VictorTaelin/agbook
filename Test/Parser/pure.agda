module Test.Parser.pure where

open import Data.Parser.pure
open import Data.Parser.State
open import Data.Parser.Reply
open import Data.Parser.Type
open import Data.Result.Type
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-pure-nat : (pure 42) (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) 42)
test-pure-nat = refl

test-pure-string : (pure "hello") (MkState "abc" 0) === Done (MkReply (MkState "abc" 0) "hello")
test-pure-string = refl