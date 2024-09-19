module Base.Parser.Test.Reply where

open import Base.Parser.Reply
open import Base.Pair.Type
open import Base.Parser.State
open import Base.String.Type
open import Base.Nat.Type
open import Base.Equal.Type

test-reply-fields : let r = MkReply (MkState "abc" 0) 42 in (Reply.state r , Reply.value r) === (MkState "abc" 0 , 42)
test-reply-fields = refl