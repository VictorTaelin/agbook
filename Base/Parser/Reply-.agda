module Base.Parser.Reply- where

open import Base.Parser.Reply
open import Base.Pair.Pair
open import Base.Parser.State
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

test-reply-fields : let r = MkReply (MkState "abc" 0) 42 in (Reply.state r , Reply.value r) ≡ (MkState "abc" 0 , 42)
test-reply-fields = refl