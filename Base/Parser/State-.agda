module Base.Parser.State- where

open import Base.Parser.State
open import Base.Nat.Nat
open import Base.Pair.Pair
open import Base.String.String
open import Base.Equal.Equal

test-new-parser-state : new-parser-state "hello" ≡ MkState "hello" 0
test-new-parser-state = refl

test-state-fields : 
  let s : State
      s = MkState "world" 5
      result : Pair String Nat
      result = (State.input s , State.index s)
  in result ≡ ("world" , 5)
test-state-fields = refl

