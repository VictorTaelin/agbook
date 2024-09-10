module Test.Parser.Reply where

open import Data.Parser.Reply
open import Data.Pair.Type
open import Data.Parser.State
open import Data.String.Type
open import Data.Nat.Type
open import Data.Equal.Type

test-reply-fields : let r = MkReply (MkState "abc" 0) 42 in (Reply.state r , Reply.value r) == (MkState "abc" 0 , 42)
test-reply-fields = refl