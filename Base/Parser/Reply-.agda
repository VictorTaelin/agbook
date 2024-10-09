module Base.Parser.Reply- where

open import Base.Parser.Reply
open import Base.Pair.Pair
open import Base.Parser.State
open import Base.String.String
open import Base.Nat.Nat
open import Base.Equal.Equal

test-reply-fields : 
  let r : Reply Nat
      r = MkReply (MkState "abc" 0) 42
      result : Pair State Nat
      result = (Reply.state r , Reply.value r)
  in result ≡ (MkState "abc" 0 , 42)
test-reply-fields = refl

